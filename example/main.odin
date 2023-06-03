package main

import "core:fmt"
import "core:log"
import "core:mem"
import "core:strings"
import "core:os"
import usb ".."

main :: proc() {
	ctx: ^usb.libusb_context
	log.debug(usb.libusb_error(usb.init(&ctx)))
	defer usb.exit(ctx)

	devlist: [^]^usb.libusb_device
	n := usb.get_device_list(ctx, &devlist)
	if n == 0 {
		n = int(usb.libusb_error.LIBUSB_ERROR_NOT_FOUND)
	}

	defer usb.free_device_list(devlist, 1)

	if n < 0 {
		log.debug(usb.libusb_error(n))
		os.exit(1)
	}

	for dev in devlist[0:n] {
		manufactur, err := get_manufactur(dev)
		if err != .NONE {
			log.debug(err)
			os.exit(1)
		}

		fmt.printf("manufactur: %s\n", manufactur)
	}
}

get_manufactur :: proc(dev: ^usb.libusb_device) -> (str: string, err: usb.libusb_error) {
	desc: usb.libusb_device_descriptor
	usb.libusb_error(usb.get_device_descriptor(dev, &desc)) or_return

	handle: ^usb.libusb_device_handle
	usb.libusb_error(usb.open(dev, &handle)) or_return
	defer usb.close(handle)

	buf: [2 << 10]byte
	length := usb.get_string_descriptor_ascii(handle, desc.iManufacturer, &buf[0], len(buf))
	if length < 0 {
		err = usb.libusb_error(length)
		return
	}

	s, alloc_err := strings.clone_from_bytes(buf[0:length])
	if alloc_err != nil {
		log.fatal("mem alloc error")
		os.exit(1)
	}

	str = s
	return
}
