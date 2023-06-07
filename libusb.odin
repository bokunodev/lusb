package usb

import "core:c"

foreign import libusb {"system:udev", "./build/lib/libusb-1.0.a"}

foreign libusb {
	libusb_init :: proc(ctx: ^^libusb_context) -> c.int ---
	libusb_exit :: proc(ctx: ^libusb_context) ---
	@(deprecated = "deprecated, use 'libusb_set_option' instead")
	libusb_set_debug :: proc(ctx: ^libusb_context, level: c.int) ---
	libusb_set_log_cb :: proc(ctx: ^libusb_context, cb: libusb_log_cb, mode: c.int) ---
	libusb_get_version :: proc() ->  /*const*/^libusb_version ---
	libusb_has_capability :: proc(capability: c.uint32_t) -> c.int ---
	libusb_error_name :: proc(errcode: c.int) ->  /*const*/cstring ---
	libusb_setlocale :: proc(const_locale: cstring) -> c.int ---
	libusb_strerror :: proc(errcode: c.int) ->  /*const*/cstring ---
	libusb_get_device_list :: proc(ctx: ^libusb_context, list: ^[^]^libusb_device) -> c.ssize_t ---
	libusb_free_device_list :: proc(list: [^]^libusb_device, unref_devices: c.int) ---
	libusb_ref_device :: proc(dev: ^libusb_device) -> ^libusb_device ---
	libusb_unref_device :: proc(dev: ^libusb_device) ---
	libusb_get_configuration :: proc(dev: ^libusb_device_handle, config: ^c.int) -> c.int ---
	libusb_get_device_descriptor :: proc(dev: ^libusb_device, desc: ^libusb_device_descriptor) -> c.int ---
	libusb_get_active_config_descriptor :: proc(dev: ^libusb_device, config: ^^libusb_config_descriptor) -> c.int ---
	libusb_get_config_descriptor :: proc(dev: ^libusb_device, config_index: c.uint8_t, config: ^^libusb_config_descriptor) -> c.int ---
	libusb_get_config_descriptor_by_value :: proc(dev: ^libusb_device, bConfigurationValue: c.uint8_t, config: ^^libusb_config_descriptor) -> c.int ---
	libusb_free_config_descriptor :: proc(config: ^libusb_config_descriptor) ---
	libusb_get_ss_endpoint_companion_descriptor :: proc(ctx: ^libusb_context, const_endpoint: ^libusb_endpoint_descriptor, ep_comp: ^^libusb_ss_endpoint_companion_descriptor) -> c.int ---
	libusb_free_ss_endpoint_companion_descriptor :: proc(ep_comp: ^libusb_ss_endpoint_companion_descriptor) ---
	libusb_get_bos_descriptor :: proc(dev_handle: ^libusb_device_handle, bos: ^^libusb_bos_descriptor) -> c.int ---
	libusb_free_bos_descriptor :: proc(bos: ^libusb_bos_descriptor) ---
	libusb_get_usb_2_0_extension_descriptor :: proc(ctx: ^libusb_context, dev_cap: ^libusb_bos_dev_capability_descriptor, usb_2_0_extension: ^^libusb_usb_2_0_extension_descriptor) -> c.int ---
	libusb_free_usb_2_0_extension_descriptor :: proc(usb_2_0_extension: ^libusb_usb_2_0_extension_descriptor) ---
	libusb_get_ss_usb_device_capability_descriptor :: proc(ctx: ^libusb_context, dev_cap: ^libusb_bos_dev_capability_descriptor, ss_usb_device_cap: ^^libusb_ss_usb_device_capability_descriptor) -> c.int ---
	libusb_free_ss_usb_device_capability_descriptor :: proc(ss_usb_device_cap: ^libusb_ss_usb_device_capability_descriptor) ---
	libusb_get_container_id_descriptor :: proc(ctx: ^libusb_context, dev_cap: ^libusb_bos_dev_capability_descriptor, container_id: ^^libusb_container_id_descriptor) -> c.int ---
	libusb_free_container_id_descriptor :: proc(container_id: ^libusb_container_id_descriptor) ---
	libusb_get_bus_number :: proc(dev: ^libusb_device) -> c.uint8_t ---
	libusb_get_port_number :: proc(dev: ^libusb_device) -> c.uint8_t ---
	libusb_get_port_numbers :: proc(dev: ^libusb_device, port_numbers: ^c.uint8_t, port_numbers_len: c.int) -> c.int ---
	@(deprecated = "deprecated, use 'libusb_get_port_numbers' instead")
	libusb_get_port_path :: proc(ctx: ^libusb_context, dev: ^libusb_device, path: ^c.uint8_t, path_length: c.uint8_t) -> c.int ---
	libusb_get_parent :: proc(dev: ^libusb_device) -> ^libusb_device ---
	libusb_get_device_address :: proc(dev: ^libusb_device) -> c.uint8_t ---
	libusb_get_device_speed :: proc(dev: ^libusb_device) -> c.int ---
	libusb_get_max_packet_size :: proc(dev: ^libusb_device, endpoint: c.uchar) -> c.int ---
	libusb_get_max_iso_packet_size :: proc(dev: ^libusb_device, endpoint: c.uchar) -> c.int ---
	libusb_wrap_sys_device :: proc(ctx: ^libusb_context, sys_dev: c.intptr_t, dev_handle: ^^libusb_device_handle) -> c.int ---
	libusb_open :: proc(dev: ^libusb_device, dev_handle: ^^libusb_device_handle) -> c.int ---
	libusb_close :: proc(dev_handle: ^libusb_device_handle) ---
	libusb_get_device :: proc(dev_handle: ^libusb_device_handle) -> ^libusb_device ---
	libusb_set_configuration :: proc(dev_handle: ^libusb_device_handle, configuration: c.int) -> c.int ---
	libusb_claim_interface :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int) -> c.int ---
	libusb_release_interface :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int) -> c.int ---
	libusb_open_device_with_vid_pid :: proc(ctx: ^libusb_context, vendor_id: c.uint16_t, product_id: c.uint16_t) -> ^libusb_device_handle ---
	libusb_set_interface_alt_setting :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int, alternate_setting: c.int) -> c.int ---
	libusb_clear_halt :: proc(dev_handle: ^libusb_device_handle, endpoint: c.uchar) -> c.int ---
	libusb_reset_device :: proc(dev_handle: ^libusb_device_handle) -> c.int ---
	libusb_alloc_streams :: proc(dev_handle: ^libusb_device_handle, num_streams: c.uint32_t, endpoints: ^c.uchar, num_endpoints: c.int) -> c.int ---
	libusb_free_streams :: proc(dev_handle: ^libusb_device_handle, endpoints: ^c.uchar, num_endpoints: c.int) -> c.int ---
	libusb_dev_mem_alloc :: proc(dev_handle: ^libusb_device_handle, length: c.size_t) -> ^c.uchar ---
	libusb_dev_mem_free :: proc(dev_handle: ^libusb_device_handle, buffer: ^c.uchar, length: c.size_t) -> c.int ---
	libusb_kernel_driver_active :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int) -> c.int ---
	libusb_detach_kernel_driver :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int) -> c.int ---
	libusb_attach_kernel_driver :: proc(dev_handle: ^libusb_device_handle, interface_number: c.int) -> c.int ---
	libusb_set_auto_detach_kernel_driver :: proc(dev_handle: ^libusb_device_handle, enable: c.int) -> c.int ---
	libusb_alloc_transfer :: proc(iso_packets: c.int) -> ^libusb_transfer ---
	libusb_submit_transfer :: proc(transfer: ^libusb_transfer) -> c.int ---
	libusb_cancel_transfer :: proc(transfer: ^libusb_transfer) -> c.int ---
	libusb_free_transfer :: proc(transfer: ^libusb_transfer) ---
	libusb_control_transfer :: proc(dev_handle: ^libusb_device_handle, request_type: c.uint8_t, bRequest: c.uint8_t, wValue: c.uint16_t, wIndex: c.uint16_t, data: ^c.uchar, wLength: c.uint16_t, timeout: c.uint) -> c.int ---
	libusb_transfer_set_stream_id :: proc(transfer: ^libusb_transfer, stream_id: c.uint32_t) ---
	libusb_transfer_get_stream_id :: proc(transfer: ^libusb_transfer) -> c.uint32_t ---
	libusb_get_string_descriptor_ascii :: proc(dev_handle: ^libusb_device_handle, desc_index: c.uint8_t, data: ^c.uchar, length: c.int) -> c.int ---
	libusb_try_lock_events :: proc(ctx: ^libusb_context) -> c.int ---
	libusb_lock_events :: proc(ctx: ^libusb_context) ---
	libusb_unlock_events :: proc(ctx: ^libusb_context) ---
	libusb_event_handling_ok :: proc(ctx: ^libusb_context) -> c.int ---
	libusb_event_handler_active :: proc(ctx: ^libusb_context) -> c.int ---
	libusb_interrupt_event_handler :: proc(ctx: ^libusb_context) ---
	libusb_lock_event_waiters :: proc(ctx: ^libusb_context) ---
	libusb_unlock_event_waiters :: proc(ctx: ^libusb_context) ---
	libusb_wait_for_event :: proc(ctx: ^libusb_context, tv: ^timeval) -> c.int ---
	libusb_handle_events_timeout :: proc(ctx: ^libusb_context, tv: ^timeval) -> c.int ---
	libusb_handle_events_timeout_completed :: proc(ctx: ^libusb_context, tv: ^timeval, completed: ^c.int) -> c.int ---
	libusb_handle_events :: proc(ctx: ^libusb_context) -> c.int ---
	libusb_handle_events_completed :: proc(ctx: ^libusb_context, completed: ^c.int) -> c.int ---
	libusb_handle_events_locked :: proc(ctx: ^libusb_context, tv: ^timeval) -> c.int ---
	libusb_pollfds_handle_timeouts :: proc(ctx: ^libusb_context) -> c.int ---
	libusb_get_next_timeout :: proc(ctx: ^libusb_context, tv: ^timeval) -> c.int ---
	libusb_get_pollfds :: proc(ctx: ^libusb_context) ->  /*const*/[^]^libusb_pollfd ---
	libusb_free_pollfds :: proc(const_pollfds: [^]^libusb_pollfd) ---
	libusb_set_pollfd_notifiers :: proc(ctx: ^libusb_context, added_cb: libusb_pollfd_added_cb, removed_cb: libusb_pollfd_removed_cb, user_data: rawptr) ---
	libusb_hotplug_register_callback :: proc(ctx: ^libusb_context, events: c.int, flags: c.int, vendor_id: c.int, product_id: c.int, dev_class: c.int, cb_fn: libusb_hotplug_callback_fn, user_data: rawptr, callback_handle: ^libusb_hotplug_callback_handle) -> c.int ---
	libusb_hotplug_deregister_callback :: proc(ctx: ^libusb_context, callback_handle: libusb_hotplug_callback_handle) ---
	libusb_hotplug_get_user_data :: proc(ctx: ^libusb_context, callback_handle: libusb_hotplug_callback_handle) -> rawptr ---
	libusb_set_option :: proc(ctx: ^libusb_context, #c_vararg option: ..libusb_option) -> c.int ---
}

LIBUSB_API_VERSION :: 0x01000109
LIBUSBX_API_VERSION :: LIBUSB_API_VERSION
LIBUSB_DT_DEVICE_SIZE :: 18
LIBUSB_DT_CONFIG_SIZE :: 9
LIBUSB_DT_INTERFACE_SIZE :: 9
LIBUSB_DT_ENDPOINT_SIZE :: 7
LIBUSB_DT_ENDPOINT_AUDIO_SIZE :: 9
LIBUSB_DT_HUB_NONVAR_SIZE :: 7
LIBUSB_DT_SS_ENDPOINT_COMPANION_SIZE :: 6
LIBUSB_DT_BOS_SIZE :: 5
LIBUSB_DT_DEVICE_CAPABILITY_SIZE :: 3
LIBUSB_BT_USB_2_0_EXTENSION_SIZE :: 7
LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE :: 10
LIBUSB_BT_CONTAINER_ID_SIZE :: 20
LIBUSB_ENDPOINT_ADDRESS_MASK :: 0x0F
LIBUSB_ENDPOINT_DIR_MASK :: 0x80
LIBUSB_TRANSFER_TYPE_MASK :: 0x03
LIBUSB_ISO_SYNC_TYPE_MASK :: 0x0C
LIBUSB_ISO_USAGE_TYPE_MASK :: 0x30
LIBUSB_CONTROL_SETUP_SIZE :: size_of(libusb_control_setup)
LIBUSB_ERROR_COUNT :: 14
LIBUSB_HOTPLUG_NO_FLAGS :: 0
LIBUSB_HOTPLUG_MATCH_ANY :: -1
LIBUSB_OPTION_WEAK_AUTHORITY :: libusb_option.LIBUSB_OPTION_NO_DEVICE_DISCOVERY
LIBUSB_DT_BOS_MAX_SIZE ::
	(LIBUSB_DT_BOS_SIZE +
		LIBUSB_BT_USB_2_0_EXTENSION_SIZE +
		LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE +
		LIBUSB_BT_CONTAINER_ID_SIZE)

timeval :: struct {
	tv_sec:  c.long,
	tv_usec: c.long,
}

libusb_log_cb :: proc(ctx: ^libusb_context, level: libusb_log_level, const_str: cstring)
libusb_pollfd_removed_cb :: proc(fd: c.int, user_data: rawptr)
libusb_pollfd_added_cb :: proc(fd: c.int, events: c.short, user_data: rawptr)
libusb_transfer_cb_fn :: proc(transfer: ^libusb_transfer)
libusb_hotplug_callback_fn :: proc(
	ctx: ^libusb_context,
	device: ^libusb_device,
	event: libusb_hotplug_event,
	user_data: rawptr,
) -> c.int

libusb_hotplug_callback_handle :: c.int

libusb_device_descriptor :: struct {
	bLength:            c.uint8_t,
	bDescriptorType:    c.uint8_t,
	bcdUSB:             c.uint16_t,
	bDeviceClass:       c.uint8_t,
	bDeviceSubClass:    c.uint8_t,
	bDeviceProtocol:    c.uint8_t,
	bMaxPacketSize0:    c.uint8_t,
	idVendor:           c.uint16_t,
	idProduct:          c.uint16_t,
	bcdDevice:          c.uint16_t,
	iManufacturer:      c.uint8_t,
	iProduct:           c.uint8_t,
	iSerialNumber:      c.uint8_t,
	bNumConfigurations: c.uint8_t,
}

libusb_endpoint_descriptor :: struct {
	bLength:          c.uint8_t,
	bDescriptorType:  c.uint8_t,
	bEndpointAddress: c.uint8_t,
	bmAttributes:     c.uint8_t,
	wMaxPacketSize:   c.uint16_t,
	bInterval:        c.uint8_t,
	bRefresh:         c.uint8_t,
	bSynchAddress:    c.uint8_t,
	extra:             /*const*/^c.uchar,
	extra_length:     c.int,
}

libusb_interface_descriptor :: struct {
	bLength:            c.uint8_t,
	bDescriptorType:    c.uint8_t,
	bInterfaceNumber:   c.uint8_t,
	bAlternateSetting:  c.uint8_t,
	bNumEndpoints:      c.uint8_t,
	bInterfaceClass:    c.uint8_t,
	bInterfaceSubClass: c.uint8_t,
	bInterfaceProtocol: c.uint8_t,
	iInterface:         c.uint8_t,
	endpoint:            /*const*/^libusb_endpoint_descriptor,
	extra:               /*const*/^c.uchar,
	extra_length:       c.int,
}

libusb_interface :: struct {
	altsetting:      /*const*/^libusb_interface_descriptor,
	num_altsetting: c.int,
}

libusb_config_descriptor :: struct {
	bLength:             c.uint8_t,
	bDescriptorType:     c.uint8_t,
	wTotalLength:        c.uint16_t,
	bNumInterfaces:      c.uint8_t,
	bConfigurationValue: c.uint8_t,
	iConfiguration:      c.uint8_t,
	bmAttributes:        c.uint8_t,
	MaxPower:            c.uint8_t,
	interface:            /*const*/^libusb_interface,
	extra:                /*const*/^c.uchar,
	extra_length:        c.int,
}

libusb_ss_endpoint_companion_descriptor :: struct {
	bLength:           c.uint8_t,
	bDescriptorType:   c.uint8_t,
	bMaxBurst:         c.uint8_t,
	bmAttributes:      c.uint8_t,
	wBytesPerInterval: c.uint16_t,
}

libusb_bos_dev_capability_descriptor :: struct {
	bLength:             c.uint8_t,
	bDescriptorType:     c.uint8_t,
	bDevCapabilityType:  c.uint8_t,
	dev_capability_data: [0]c.uint8_t,
}

libusb_bos_descriptor :: struct {
	bLength:         c.uint8_t,
	bDescriptorType: c.uint8_t,
	wTotalLength:    c.uint16_t,
	bNumDeviceCaps:  c.uint8_t,
	dev_capability:  [0]^libusb_bos_dev_capability_descriptor,
}

libusb_usb_2_0_extension_descriptor :: struct {
	bLength:            c.uint8_t,
	bDescriptorType:    c.uint8_t,
	bDevCapabilityType: c.uint8_t,
	bmAttributes:       c.uint32_t,
}

libusb_ss_usb_device_capability_descriptor :: struct {
	bLength:               c.uint8_t,
	bDescriptorType:       c.uint8_t,
	bDevCapabilityType:    c.uint8_t,
	bmAttributes:          c.uint8_t,
	wSpeedSupported:       c.uint16_t,
	bFunctionalitySupport: c.uint8_t,
	bU1DevExitLat:         c.uint8_t,
	bU2DevExitLat:         c.uint16_t,
}

libusb_container_id_descriptor :: struct {
	bLength:            c.uint8_t,
	bDescriptorType:    c.uint8_t,
	bDevCapabilityType: c.uint8_t,
	bReserved:          c.uint8_t,
	ContainerID:        [16]c.uint8_t,
}

libusb_control_setup :: struct {
	bmRequestType: c.uint8_t,
	bRequest:      c.uint8_t,
	wValue:        c.uint16_t,
	wIndex:        c.uint16_t,
	wLength:       c.uint16_t,
}

libusb_context :: distinct struct {}
libusb_device :: distinct struct {}
libusb_device_handle :: distinct struct {}

libusb_version :: struct {
	major:     /*const*/c.uint16_t,
	minor:     /*const*/c.uint16_t,
	micro:     /*const*/c.uint16_t,
	nano:      /*const*/c.uint16_t,
	rc:        /*const*/cstring,
	describe:  /*const*/cstring,
}

libusb_iso_packet_descriptor :: struct {
	length:        c.uint,
	actual_length: c.uint,
	status:        libusb_transfer_status,
}

libusb_transfer :: struct {
	dev_handle:      ^libusb_device_handle,
	flags:           c.uint8_t,
	endpoint:        c.uchar,
	type:            c.uchar,
	timeout:         c.uint,
	status:          libusb_transfer_status,
	length:          c.int,
	actual_length:   c.int,
	callback:        libusb_transfer_cb_fn,
	user_data:       rawptr,
	buffer:          ^c.uchar,
	num_iso_packets: c.int,
	iso_packet_desc: [0]libusb_iso_packet_descriptor,
}

libusb_pollfd :: struct {
	fd:     c.int,
	events: c.short,
}

cpu_to_le16 :: #force_inline proc(const_x: c.uint16_t) -> c.uint16_t {
	_tmp: struct #raw_union {
		b8:  [2]c.uint8_t,
		b16: c.uint16_t,
	}

	_tmp.b8[1] = c.uint8_t(const_x >> 8)
	_tmp.b8[0] = c.uint8_t(const_x & 0xff)
	return _tmp.b16
}

control_transfer_get_setup :: #force_inline proc(transfer: ^libusb_transfer) -> ^libusb_control_setup {
	return (^libusb_control_setup)(transfer.buffer)
}

fill_control_setup :: #force_inline proc(
	buffer: ^c.uchar,
	bmRequestType: c.uint8_t,
	bRequest: c.uint8_t,
	wValue: c.uint16_t,
	wIndex: c.uint16_t,
	wLength: c.uint16_t,
) {
	setup := (^libusb_control_setup)(buffer)
	setup.bmRequestType = bmRequestType
	setup.bRequest = bRequest
	setup.wValue = cpu_to_le16(wValue)
	setup.wIndex = cpu_to_le16(wIndex)
	setup.wLength = cpu_to_le16(wLength)
}

fill_control_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: ^libusb_device_handle,
	buffer: ^c.uchar,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: c.uint,
) {
	setup := (^libusb_control_setup)(buffer)
	transfer.dev_handle = dev_handle
	transfer.endpoint = 0
	transfer.type = c.uchar(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_CONTROL)
	transfer.timeout = c.uint32_t(timeout)
	transfer.buffer = buffer

	if setup != nil {
		transfer.length = c.int(size_of(libusb_control_setup) + cpu_to_le16(setup.wLength))
	}

	transfer.user_data = user_data
	transfer.callback = callback
}

fill_bulk_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: ^libusb_device_handle,
	endpoint: c.uchar,
	buffer: ^c.uchar,
	length: c.int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: c.uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = c.uchar(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_BULK)
	transfer.timeout = c.uint32_t(timeout)
	transfer.buffer = buffer
	transfer.length = length
	transfer.user_data = user_data
	transfer.callback = callback
}

fill_bulk_stream_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: ^libusb_device_handle,
	endpoint: c.uchar,
	stream_id: c.uint32_t,
	buffer: ^c.uchar,
	length: c.int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: c.uint,
) {
	fill_bulk_transfer(transfer, dev_handle, endpoint, buffer, length, callback, user_data, timeout)
	transfer.type = c.uchar(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_BULK_STREAM)
	libusb_transfer_set_stream_id(transfer, stream_id)
}

fill_interrupt_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: ^libusb_device_handle,
	endpoint: c.uchar,
	buffer: ^c.uchar,
	length: c.int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: c.uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = c.uchar(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_INTERRUPT)
	transfer.timeout = c.uint32_t(timeout)
	transfer.buffer = buffer
	transfer.length = length
	transfer.user_data = user_data
	transfer.callback = callback
}

fill_iso_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: ^libusb_device_handle,
	endpoint: c.uchar,
	buffer: ^c.uchar,
	length: c.int,
	num_iso_packets: c.int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: c.uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = c.uchar(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_ISOCHRONOUS)
	transfer.timeout = c.uint32_t(timeout)
	transfer.buffer = buffer
	transfer.length = length
	transfer.num_iso_packets = num_iso_packets
	transfer.user_data = user_data
	transfer.callback = callback
}

set_iso_packet_lengths :: #force_inline proc(transfer: ^libusb_transfer, length: c.uint) {
	for i: c.int = 0; i < transfer.num_iso_packets; i += 1 {
		transfer.iso_packet_desc[i].length = c.uint(length)
	}
}

get_descriptor :: #force_inline proc(
	dev_handle: ^libusb_device_handle,
	desc_type: c.uint8_t,
	desc_index: c.uint8_t,
	data: ^c.uchar,
	length: c.int,
) -> c.int {
	return libusb_control_transfer(
		dev_handle,
		c.uchar(libusb_endpoint_direction.LIBUSB_ENDPOINT_IN),
		c.uchar(libusb_standard_request.LIBUSB_REQUEST_GET_DESCRIPTOR),
		c.uint16_t((desc_type << 8) | desc_index),
		0,
		data,
		c.uint16_t(length),
		1000,
	)
}

get_string_descriptor :: #force_inline proc(
	dev_handle: ^libusb_device_handle,
	desc_index: c.uint8_t,
	langid: c.uint16_t,
	data: ^c.uchar,
	length: c.int,
) -> c.int {
	return libusb_control_transfer(
		dev_handle,
		c.uchar(libusb_endpoint_direction.LIBUSB_ENDPOINT_IN),
		c.uchar(libusb_standard_request.LIBUSB_REQUEST_GET_DESCRIPTOR),
		c.uint16_t((c.uint16_t(libusb_descriptor_type.LIBUSB_DT_STRING) << 8) | c.uint16_t(desc_index)),
		langid,
		data,
		c.uint16_t(length),
		1000,
	)
}

libusb_class_code :: enum {
	LIBUSB_CLASS_PER_INTERFACE       = 0x00,
	LIBUSB_CLASS_AUDIO               = 0x01,
	LIBUSB_CLASS_COMM                = 0x02,
	LIBUSB_CLASS_HID                 = 0x03,
	LIBUSB_CLASS_PHYSICAL            = 0x05,
	LIBUSB_CLASS_IMAGE               = 0x06,
	LIBUSB_CLASS_PTP                 = 0x06,
	LIBUSB_CLASS_PRINTER             = 0x07,
	LIBUSB_CLASS_MASS_STORAGE        = 0x08,
	LIBUSB_CLASS_HUB                 = 0x09,
	LIBUSB_CLASS_DATA                = 0x0a,
	LIBUSB_CLASS_SMART_CARD          = 0x0b,
	LIBUSB_CLASS_CONTENT_SECURITY    = 0x0d,
	LIBUSB_CLASS_VIDEO               = 0x0e,
	LIBUSB_CLASS_PERSONAL_HEALTHCARE = 0x0f,
	LIBUSB_CLASS_DIAGNOSTIC_DEVICE   = 0xdc,
	LIBUSB_CLASS_WIRELESS            = 0xe0,
	LIBUSB_CLASS_MISCELLANEOUS       = 0xef,
	LIBUSB_CLASS_APPLICATION         = 0xfe,
	LIBUSB_CLASS_VENDOR_SPEC         = 0xff,
}

libusb_descriptor_type :: enum {
	LIBUSB_DT_DEVICE                = 0x01,
	LIBUSB_DT_CONFIG                = 0x02,
	LIBUSB_DT_STRING                = 0x03,
	LIBUSB_DT_INTERFACE             = 0x04,
	LIBUSB_DT_ENDPOINT              = 0x05,
	LIBUSB_DT_BOS                   = 0x0f,
	LIBUSB_DT_DEVICE_CAPABILITY     = 0x10,
	LIBUSB_DT_HID                   = 0x21,
	LIBUSB_DT_REPORT                = 0x22,
	LIBUSB_DT_PHYSICAL              = 0x23,
	LIBUSB_DT_HUB                   = 0x29,
	LIBUSB_DT_SUPERSPEED_HUB        = 0x2a,
	LIBUSB_DT_SS_ENDPOINT_COMPANION = 0x30,
}

libusb_endpoint_direction :: enum {
	LIBUSB_ENDPOINT_OUT = 0x00,
	LIBUSB_ENDPOINT_IN  = 0x80,
}

libusb_endpoint_transfer_type :: enum {
	LIBUSB_ENDPOINT_TRANSFER_TYPE_CONTROL     = 0x0,
	LIBUSB_ENDPOINT_TRANSFER_TYPE_ISOCHRONOUS = 0x1,
	LIBUSB_ENDPOINT_TRANSFER_TYPE_BULK        = 0x2,
	LIBUSB_ENDPOINT_TRANSFER_TYPE_INTERRUPT   = 0x3,
}

libusb_standard_request :: enum {
	LIBUSB_REQUEST_GET_STATUS        = 0x00,
	LIBUSB_REQUEST_CLEAR_FEATURE     = 0x01,
	LIBUSB_REQUEST_SET_FEATURE       = 0x03,
	LIBUSB_REQUEST_SET_ADDRESS       = 0x05,
	LIBUSB_REQUEST_GET_DESCRIPTOR    = 0x06,
	LIBUSB_REQUEST_SET_DESCRIPTOR    = 0x07,
	LIBUSB_REQUEST_GET_CONFIGURATION = 0x08,
	LIBUSB_REQUEST_SET_CONFIGURATION = 0x09,
	LIBUSB_REQUEST_GET_INTERFACE     = 0x0a,
	LIBUSB_REQUEST_SET_INTERFACE     = 0x0b,
	LIBUSB_REQUEST_SYNCH_FRAME       = 0x0c,
	LIBUSB_REQUEST_SET_SEL           = 0x30,
	LIBUSB_SET_ISOCH_DELAY           = 0x31,
}

libusb_request_type :: enum {
	LIBUSB_REQUEST_TYPE_STANDARD = (0x00 << 5),
	LIBUSB_REQUEST_TYPE_CLASS    = (0x01 << 5),
	LIBUSB_REQUEST_TYPE_VENDOR   = (0x02 << 5),
	LIBUSB_REQUEST_TYPE_RESERVED = (0x03 << 5),
}

libusb_request_recipient :: enum {
	LIBUSB_RECIPIENT_DEVICE    = 0x00,
	LIBUSB_RECIPIENT_INTERFACE = 0x01,
	LIBUSB_RECIPIENT_ENDPOINT  = 0x02,
	LIBUSB_RECIPIENT_OTHER     = 0x03,
}

libusb_iso_sync_type :: enum {
	LIBUSB_ISO_SYNC_TYPE_NONE     = 0x0,
	LIBUSB_ISO_SYNC_TYPE_ASYNC    = 0x1,
	LIBUSB_ISO_SYNC_TYPE_ADAPTIVE = 0x2,
	LIBUSB_ISO_SYNC_TYPE_SYNC     = 0x3,
}

libusb_iso_usage_type :: enum {
	LIBUSB_ISO_USAGE_TYPE_DATA     = 0x0,
	LIBUSB_ISO_USAGE_TYPE_FEEDBACK = 0x1,
	LIBUSB_ISO_USAGE_TYPE_IMPLICIT = 0x2,
}

libusb_supported_speed :: enum {
	LIBUSB_LOW_SPEED_OPERATION   = (1 << 0),
	LIBUSB_FULL_SPEED_OPERATION  = (1 << 1),
	LIBUSB_HIGH_SPEED_OPERATION  = (1 << 2),
	LIBUSB_SUPER_SPEED_OPERATION = (1 << 3),
}

libusb_usb_2_0_extension_attributes :: enum {
	LIBUSB_BM_LPM_SUPPORT = (1 << 1),
}

libusb_ss_usb_device_capability_attributes :: enum {
	LIBUSB_BM_LTM_SUPPORT = (1 << 1),
}

libusb_bos_type :: enum {
	LIBUSB_BT_WIRELESS_USB_DEVICE_CAPABILITY = 0x01,
	LIBUSB_BT_USB_2_0_EXTENSION              = 0x02,
	LIBUSB_BT_SS_USB_DEVICE_CAPABILITY       = 0x03,
	LIBUSB_BT_CONTAINER_ID                   = 0x04,
}

libusb_speed :: enum {
	LIBUSB_SPEED_UNKNOWN    = 0,
	LIBUSB_SPEED_LOW        = 1,
	LIBUSB_SPEED_FULL       = 2,
	LIBUSB_SPEED_HIGH       = 3,
	LIBUSB_SPEED_SUPER      = 4,
	LIBUSB_SPEED_SUPER_PLUS = 5,
}

libusb_error :: enum {
	LIBUSB_SUCCESS             = 0,
	NONE                       = LIBUSB_SUCCESS,
	LIBUSB_ERROR_IO            = -1,
	LIBUSB_ERROR_INVALID_PARAM = -2,
	LIBUSB_ERROR_ACCESS        = -3,
	LIBUSB_ERROR_NO_DEVICE     = -4,
	LIBUSB_ERROR_NOT_FOUND     = -5,
	LIBUSB_ERROR_BUSY          = -6,
	LIBUSB_ERROR_TIMEOUT       = -7,
	LIBUSB_ERROR_OVERFLOW      = -8,
	LIBUSB_ERROR_PIPE          = -9,
	LIBUSB_ERROR_INTERRUPTED   = -10,
	LIBUSB_ERROR_NO_MEM        = -11,
	LIBUSB_ERROR_NOT_SUPPORTED = -12,
	LIBUSB_ERROR_OTHER         = -99,
}

libusb_transfer_type :: enum {
	LIBUSB_TRANSFER_TYPE_CONTROL     = 0,
	LIBUSB_TRANSFER_TYPE_ISOCHRONOUS = 1,
	LIBUSB_TRANSFER_TYPE_BULK        = 2,
	LIBUSB_TRANSFER_TYPE_INTERRUPT   = 3,
	LIBUSB_TRANSFER_TYPE_BULK_STREAM = 4,
}

libusb_transfer_status :: enum {
	LIBUSB_TRANSFER_COMPLETED,
	LIBUSB_TRANSFER_ERROR,
	LIBUSB_TRANSFER_TIMED_OUT,
	LIBUSB_TRANSFER_CANCELLED,
	LIBUSB_TRANSFER_STALL,
	LIBUSB_TRANSFER_NO_DEVICE,
	LIBUSB_TRANSFER_OVERFLOW,
}

libusb_transfer_flags :: enum {
	LIBUSB_TRANSFER_SHORT_NOT_OK    = 1 << 0,
	LIBUSB_TRANSFER_FREE_BUFFER     = 1 << 1,
	LIBUSB_TRANSFER_FREE_TRANSFER   = 1 << 2,
	LIBUSB_TRANSFER_ADD_ZERO_PACKET = 1 << 3,
}

libusb_capability :: enum {
	LIBUSB_CAP_HAS_CAPABILITY                = 0x0000,
	LIBUSB_CAP_HAS_HOTPLUG                   = 0x0001,
	LIBUSB_CAP_HAS_HID_ACCESS                = 0x0100,
	LIBUSB_CAP_SUPPORTS_DETACH_KERNEL_DRIVER = 0x0101,
}

libusb_log_level :: enum {
	LIBUSB_LOG_LEVEL_NONE    = 0,
	LIBUSB_LOG_LEVEL_ERROR   = 1,
	LIBUSB_LOG_LEVEL_WARNING = 2,
	LIBUSB_LOG_LEVEL_INFO    = 3,
	LIBUSB_LOG_LEVEL_DEBUG   = 4,
}

libusb_log_cb_mode :: enum {
	LIBUSB_LOG_CB_GLOBAL  = (1 << 0),
	LIBUSB_LOG_CB_CONTEXT = (1 << 1),
}

libusb_option :: enum {
	LIBUSB_OPTION_LOG_LEVEL           = 0,
	LIBUSB_OPTION_USE_USBDK           = 1,
	LIBUSB_OPTION_NO_DEVICE_DISCOVERY = 2,
	LIBUSB_OPTION_MAX                 = 3,
}

libusb_hotplug_event :: enum {
	LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED = (1 << 0),
	LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT    = (1 << 1),
}
