package usb

import "core:c"

when #config(HIDAPI_USE_LIBUSB, false) {
	foreign import hidapi {"system:udev", "./build/lib/libusb-1.0.a", "./build/lib/libhidapi-libusb.a"}
} else {
	foreign import hidapi {"system:udev", "system:hidraw", "./build/lib/libhidapi-hidraw.a"}
}

foreign hidapi {
	hid_init :: proc() -> c.int ---
	hid_exit :: proc() -> c.int ---
	hid_enumerate :: proc(vendor_id: c.ushort, product_id: c.ushort) -> ^hid_device_info ---
	hid_free_enumeration :: proc(devs: ^hid_device_info) ---
	hid_open :: proc(vendor_id: c.ushort, product_id: c.ushort, serial_number:  /*const*/^c.wchar_t) -> ^hid_device ---
	hid_open_path :: proc(path:  /*const*/^c.char) -> ^hid_device ---
	hid_write :: proc(dev: ^hid_device,  /*const*/data: ^c.uchar, length: c.size_t) -> c.int ---
	hid_read_timeout :: proc(dev: ^hid_device, data: ^c.uchar, length: c.size_t, milliseconds: c.int) -> c.int ---
	hid_read :: proc(dev: ^hid_device, data: ^c.uchar, length: c.size_t) -> c.int ---
	hid_set_nonblocking :: proc(dev: ^hid_device, nonblock: c.int) -> c.int ---
	hid_send_feature_report :: proc(dev: ^hid_device,  /*const*/data: ^c.uchar, length: c.size_t) -> c.int ---
	hid_get_feature_report :: proc(dev: ^hid_device, data: ^c.uchar, length: c.size_t) -> c.int ---
	hid_get_input_report :: proc(dev: ^hid_device, data: ^c.uchar, length: c.size_t) -> c.int ---
	hid_close :: proc(dev: ^hid_device) ---
	hid_get_manufacturer_string :: proc(dev: ^hid_device, string: ^c.wchar_t, maxlen: c.size_t) -> c.int ---
	hid_get_product_string :: proc(dev: ^hid_device, string: ^c.wchar_t, maxlen: c.size_t) -> c.int ---
	hid_get_serial_number_string :: proc(dev: ^hid_device, string: ^c.wchar_t, maxlen: c.size_t) -> c.int ---
	hid_get_device_info :: proc(dev: ^hid_device) -> ^hid_device_info ---
	hid_get_indexed_string :: proc(dev: ^hid_device, string_index: c.int, string: ^c.wchar_t, maxlen: c.size_t) -> c.int ---
	hid_get_report_descriptor :: proc(dev: ^hid_device, buf: ^c.uchar, buf_size: c.size_t) -> c.int ---
	hid_error :: proc(dev: ^hid_device) ->  /*const*/^c.wchar_t ---
	hid_version :: proc() ->  /*const*/^hid_api_version ---
	hid_version_str :: proc() ->  /*const*/^c.char ---
}

hid_device :: distinct struct {}

hid_api_version :: struct {
	major: c.int,
	minor: c.int,
	patch: c.int,
}

hid_bus_type :: enum {
	HID_API_BUS_UNKNOWN   = 0x00,
	HID_API_BUS_USB       = 0x01,
	HID_API_BUS_BLUETOOTH = 0x02,
	HID_API_BUS_I2C       = 0x03,
	HID_API_BUS_SPI       = 0x04,
}

hid_device_info :: struct {
	path:                ^c.char,
	vendor_id:           c.ushort,
	product_id:          c.ushort,
	serial_number:       ^c.wchar_t,
	release_number:      c.ushort,
	manufacturer_string: ^c.wchar_t,
	product_string:      ^c.wchar_t,
	usage_page:          c.ushort,
	usage:               c.ushort,
	interface_number:    c.int,
	next:                ^hid_device_info,
	bus_type:            hid_bus_type,
}
