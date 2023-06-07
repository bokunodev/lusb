package main

import "core:c"
import "core:os"
import "core:fmt"
import "core:mem"
import "core:sync"
import "core:time"
import "core:strings"

import log "./log"
import usb ".."

id_vendor :: 0x08ff
id_product :: 0x0009

main :: proc() {
	ctx: ^usb.libusb_context
	if err := usb.libusb_error(usb.libusb_init(&ctx)); err != .NONE {
		log.fatal(to_string(err))
		os.exit(1)
	}

	defer usb.libusb_exit(ctx)

	handle := usb.libusb_open_device_with_vid_pid(ctx, id_vendor, id_product)
	if handle == nil {
		log.error("could not find usb device with the specified VendorID and ProductID")
		return
	}

	defer usb.libusb_close(handle)
}

get_device_info_string :: proc(handle: ^usb.libusb_device_handle, idx: c.uint8_t) -> (string, usb.libusb_error) {
	buf: [2 << 10]byte

	if idx == 0 {
		return "[unavailable]", .NONE
	}

	length := usb.libusb_get_string_descriptor_ascii(handle, idx, (^c.uchar)(&buf[0]), len(buf))
	if length < 0 {
		return "", usb.libusb_error(length)
	}

	return strings.clone_from_bytes(buf[:length]), .NONE
}

to_string :: proc {
	error_to_string,
}

error_to_string :: proc(err: usb.libusb_error) -> string {
	return string(usb.libusb_strerror(c.int(err)))
}

scancodes := "\x00\x00\x00\x00ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\x00"
