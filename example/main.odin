package main

import "core:fmt"
import "core:mem"
import "core:strings"
import "core:os"
import usb ".."

main :: proc() {
	ctx: usb.libusb_context_ptr
	or_panic(usb.libusb_error(usb.libusb_init(&ctx)))
	defer usb.libusb_exit(ctx)

	devlist: [^]usb.libusb_device_ptr
	n := usb.libusb_get_device_list(ctx, &devlist)
	if n == 0 {
		n = int(usb.libusb_error.LIBUSB_ERROR_NOT_FOUND)
	}

	defer usb.libusb_free_device_list(devlist, 1)

	if n < 0 {
		or_panic(usb.libusb_error(n))
	}

	for i in 0 ..< n {
		manufactur, err := get_manufactur(devlist[i])
		or_panic(err)

		fmt.printf("manufactur: %s\n", manufactur)
	}
}

or_panic :: proc(errcode: usb.libusb_error) {
	if errcode != usb.libusb_error.NONE {
		fmt.println(string(usb.libusb_strerror(int(errcode))))
		os.exit(1)
	}
}

get_manufactur :: proc(dev: usb.libusb_device_ptr) -> (str: string, err: usb.libusb_error) {
	desc: usb.libusb_device_descriptor
	usb.libusb_error(usb.libusb_get_device_descriptor(dev, &desc)) or_return

	handle: usb.libusb_device_handle_ptr
	usb.libusb_error(usb.libusb_open(dev, &handle)) or_return
	defer usb.libusb_close(handle)

	buf: [2 << 10]byte
	length := usb.libusb_get_string_descriptor_ascii(handle, desc.iManufacturer, &buf[0], len(buf))
	if length < 0 {
		err = usb.libusb_error(length)
		return
	}

	s, alloc_err := strings.clone_from_bytes(buf[0:length])
	if alloc_err != nil {
		fmt.println("mem alloc error")
		os.exit(1)
	}

	str = s
	return
}
