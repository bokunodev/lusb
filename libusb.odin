///+private
package libusb

import "core:mem"

foreign import libusb {"system:udev", "./build/lib/libusb-1.0.a"}
foreign libusb {
	libusb_init :: proc(ctx: ^libusb_context_ptr) -> int ---
	libusb_exit :: proc(ctx: libusb_context_ptr) ---
	@(deprecated = "deprecated, use 'libusb_set_option' instead")
	libusb_set_debug :: proc(ctx: libusb_context_ptr, level: int) ---
	libusb_get_version :: proc() -> ^libusb_version --- // const
	libusb_has_capability :: proc(capability: u32) -> int ---
	libusb_error_name :: proc(errcode: int) -> cstring --- // const
	libusb_setlocale :: proc(locale: cstring) -> int ---
	libusb_strerror :: proc(errcode: int) -> cstring --- // const
	libusb_get_device_list :: proc(ctx: libusb_context_ptr, list: ^[^]libusb_device_ptr) -> int ---
	libusb_free_device_list :: proc(list: [^]libusb_device_ptr, unref_devices: int) ---
	libusb_ref_device :: proc(dev: libusb_device_ptr) -> libusb_device_ptr ---
	libusb_unref_device :: proc(dev: libusb_device_ptr) ---
	libusb_get_configuration :: proc(dev: libusb_device_handle_ptr, config: ^int) -> int ---
	libusb_get_device_descriptor :: proc(dev: libusb_device_ptr, desc: ^libusb_device_descriptor) -> int ---
	libusb_get_active_config_descriptor :: proc(dev: libusb_device_ptr, config: ^^libusb_config_descriptor) -> int ---
	libusb_get_config_descriptor :: proc(dev: libusb_device_ptr, config_index: u8, config: ^^libusb_config_descriptor) -> int ---
	libusb_get_config_descriptor_by_value :: proc(dev: libusb_device_ptr, bConfigurationValue: u8, config: ^^libusb_config_descriptor) -> int ---
	libusb_free_config_descriptor :: proc(config: ^libusb_config_descriptor) ---
	libusb_get_ss_endpoint_companion_descriptor :: proc(ctx: libusb_context_ptr, endpoint: ^libusb_endpoint_descriptor, ep_comp: ^^libusb_ss_endpoint_companion_descriptor) -> int ---
	libusb_free_ss_endpoint_companion_descriptor :: proc(ep_comp: ^libusb_ss_endpoint_companion_descriptor) ---
	libusb_get_bos_descriptor :: proc(dev_handle: libusb_device_handle_ptr, bos: ^^libusb_bos_descriptor) -> int ---
	libusb_free_bos_descriptor :: proc(bos: ^libusb_bos_descriptor) ---
	libusb_get_usb_2_0_extension_descriptor :: proc(ctx: libusb_context_ptr, dev_cap: ^libusb_bos_dev_capability_descriptor, usb_2_0_extension: ^^libusb_usb_2_0_extension_descriptor) -> int ---
	libusb_free_usb_2_0_extension_descriptor :: proc(usb_2_0_extension: ^libusb_usb_2_0_extension_descriptor) ---
	libusb_get_ss_usb_device_capability_descriptor :: proc(ctx: libusb_context_ptr, dev_cap: ^libusb_bos_dev_capability_descriptor, ss_usb_device_cap: ^^libusb_ss_usb_device_capability_descriptor) -> int ---
	libusb_free_ss_usb_device_capability_descriptor :: proc(ss_usb_device_cap: ^libusb_ss_usb_device_capability_descriptor) ---
	libusb_get_container_id_descriptor :: proc(ctx: libusb_context_ptr, dev_cap: ^libusb_bos_dev_capability_descriptor, container_id: ^^libusb_container_id_descriptor) -> int ---
	libusb_free_container_id_descriptor :: proc(container_id: ^libusb_container_id_descriptor) ---
	libusb_get_bus_number :: proc(dev: libusb_device_ptr) -> u8 ---
	libusb_get_port_number :: proc(dev: libusb_device_ptr) -> u8 ---
	libusb_get_port_numbers :: proc(dev: libusb_device_ptr, port_numbers: [^]u8, port_numbers_len: int) -> int ---
	@(deprecated = "deprecated, use 'libusb_get_port_numbers' instead")
	libusb_get_port_path :: proc(ctx: libusb_context_ptr, dev: libusb_device_ptr, path: ^u8, path_length: u8) -> int ---
	libusb_get_parent :: proc(dev: libusb_device_ptr) -> libusb_device_ptr ---
	libusb_get_device_address :: proc(dev: libusb_device_ptr) -> u8 ---
	libusb_get_device_speed :: proc(dev: libusb_device_ptr) -> int ---
	libusb_get_max_packet_size :: proc(dev: libusb_device_ptr, endpoint: u8) -> int ---
	libusb_get_max_iso_packet_size :: proc(dev: libusb_device_ptr, endpoint: u8) -> int ---
	libusb_wrap_sys_device :: proc(ctx: libusb_context_ptr, sys_dev: int, dev_handle: ^libusb_device_handle_ptr) -> int ---
	libusb_open :: proc(dev: libusb_device_ptr, dev_handle: ^libusb_device_handle_ptr) -> int ---
	libusb_close :: proc(dev_handle: libusb_device_handle_ptr) ---
	libusb_get_device :: proc(dev_handle: libusb_device_handle_ptr) -> libusb_device_ptr ---
	libusb_set_configuration :: proc(dev_handle: libusb_device_handle_ptr, configuration: int) -> int ---
	libusb_claim_interface :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int) -> int ---
	libusb_release_interface :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int) -> int ---
	libusb_open_device_with_vid_pid :: proc(ctx: libusb_context_ptr, vendor_id: u16, product_id: u16) -> libusb_device_handle_ptr ---
	libusb_set_interface_alt_setting :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int, alternate_setting: int) -> int ---
	libusb_clear_halt :: proc(dev_handle: libusb_device_handle_ptr, endpoint: u8) -> int ---
	libusb_reset_device :: proc(dev_handle: libusb_device_handle_ptr) -> int ---
	libusb_alloc_streams :: proc(dev_handle: libusb_device_handle_ptr, num_streams: u32, endpoints: ^u8, num_endpoints: int) -> int ---
	libusb_free_streams :: proc(dev_handle: libusb_device_handle_ptr, endpoints: ^u8, num_endpoints: int) -> int ---
	libusb_dev_mem_alloc :: proc(dev_handle: libusb_device_handle_ptr, length: uint) -> ^u8 ---
	libusb_dev_mem_free :: proc(dev_handle: libusb_device_handle_ptr, buffer: ^u8, length: uint) -> int ---
	libusb_kernel_driver_active :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int) -> int ---
	libusb_detach_kernel_driver :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int) -> int ---
	libusb_attach_kernel_driver :: proc(dev_handle: libusb_device_handle_ptr, interface_number: int) -> int ---
	libusb_set_auto_detach_kernel_driver :: proc(dev_handle: libusb_device_handle_ptr, enable: int) -> int ---
	libusb_alloc_transfer :: proc(iso_packets: int) -> ^libusb_transfer ---
	libusb_submit_transfer :: proc(transfer: ^libusb_transfer) -> int ---
	libusb_cancel_transfer :: proc(transfer: ^libusb_transfer) -> int ---
	libusb_free_transfer :: proc(transfer: ^libusb_transfer) ---
	libusb_transfer_set_stream_id :: proc(transfer: ^libusb_transfer, stream_id: u32) ---
	libusb_transfer_get_stream_id :: proc(transfer: ^libusb_transfer) -> u32 ---
	libusb_control_transfer :: proc(dev_handle: libusb_device_handle_ptr, request_type: u8, bRequest: u8, wValue: u16, wIndex: u16, data: ^u8, wLength: u16, timeout: uint) -> int ---
	libusb_bulk_transfer :: proc(dev_handle: libusb_device_handle_ptr, endpoint: u8, data: ^u8, length: int, actual_length: ^int, timeout: uint) -> int ---
	libusb_interrupt_transfer :: proc(dev_handle: libusb_device_handle_ptr, endpoint: u8, data: ^u8, length: int, actual_length: ^int, timeout: uint) -> int ---
	libusb_get_string_descriptor_ascii :: proc(dev_handle: libusb_device_handle_ptr, desc_index: u8, data: ^u8, length: int) -> int ---
	libusb_try_lock_events :: proc(ctx: libusb_context_ptr) -> int ---
	libusb_lock_events :: proc(ctx: libusb_context_ptr) ---
	libusb_unlock_events :: proc(ctx: libusb_context_ptr) ---
	libusb_event_handling_ok :: proc(ctx: libusb_context_ptr) -> int ---
	libusb_event_handler_active :: proc(ctx: libusb_context_ptr) -> int ---
	libusb_interrupt_event_handler :: proc(ctx: libusb_context_ptr) ---
	libusb_lock_event_waiters :: proc(ctx: libusb_context_ptr) ---
	libusb_unlock_event_waiters :: proc(ctx: libusb_context_ptr) ---
	libusb_wait_for_event :: proc(ctx: libusb_context_ptr, tv: ^timeval) -> int ---
	libusb_handle_events_timeout :: proc(ctx: libusb_context_ptr, tv: ^timeval) -> int ---
	libusb_handle_events_timeout_completed :: proc(ctx: libusb_context_ptr, tv: ^timeval, completed: ^int) -> int ---
	libusb_handle_events :: proc(ctx: libusb_context_ptr) -> int ---
	libusb_handle_events_completed :: proc(ctx: libusb_context_ptr, completed: ^int) -> int ---
	libusb_handle_events_locked :: proc(ctx: libusb_context_ptr, tv: ^timeval) -> int ---
	libusb_pollfds_handle_timeouts :: proc(ctx: libusb_context_ptr) -> int ---
	libusb_get_next_timeout :: proc(ctx: libusb_context_ptr, tv: ^timeval) -> int ---
	libusb_get_pollfds :: proc(ctx: libusb_context_ptr) -> [^]^libusb_pollfd ---
	libusb_free_pollfds :: proc(pollfds: [^]^libusb_pollfd) ---
	libusb_set_pollfd_notifiers :: proc(ctx: libusb_context_ptr, added_cb: libusb_pollfd_added_cb, removed_cb: libusb_pollfd_removed_cb, user_data: rawptr) ---
	libusb_hotplug_register_callback :: proc(ctx: libusb_context_ptr, events: int, flags: int, vendor_id: int, product_id: int, dev_class: int, cb_fn: libusb_hotplug_callback_fn, user_data: rawptr, callback_handle: ^libusb_hotplug_callback_handle) -> int ---
	libusb_hotplug_deregister_callback :: proc(ctx: libusb_context_ptr, callback_handle: libusb_hotplug_callback_handle) ---
	libusb_hotplug_get_user_data :: proc(ctx: libusb_context_ptr, callback_handle: libusb_hotplug_callback_handle) -> rawptr ---
	libusb_set_option :: proc(ctx: libusb_context_ptr, #c_vararg option: ..libusb_option) -> int ---
}

libusb_log_cb :: #type proc "c" (ctx: libusb_context_ptr, level: libusb_log_level, str: cstring)
libusb_set_log_cb :: #type proc "c" (ctx: libusb_context_ptr, cb: libusb_log_cb, mode: int)
libusb_pollfd_added_cb :: #type proc "c" (fd: int, events: i16, user_data: rawptr)
libusb_pollfd_removed_cb :: #type proc "c" (fd: int, user_data: rawptr)
libusb_transfer_cb_fn :: #type proc "c" (transfer: ^libusb_transfer)
libusb_hotplug_callback_fn :: #type proc "c" (
	ctx: libusb_context_ptr,
	device: libusb_device_ptr,
	event: libusb_hotplug_event,
	user_data: rawptr,
) -> int

libusb_hotplug_callback_handle :: int

libusb_cpu_to_le16 :: #force_inline proc(x: u16) -> u16 {
	_tmp: struct #raw_union {
		b8:  [2]u8,
		b16: u16,
	}

	_tmp.b8[1] = u8(x >> 8)
	_tmp.b8[0] = u8(x & 0xff)
	return _tmp.b16
}

libusb_control_transfer_get_data :: #force_inline proc(transfer: ^libusb_transfer) -> ^u8 {
	return (^u8)(mem.ptr_offset(transfer.buffer, LIBUSB_CONTROL_SETUP_SIZE))
}

libusb_control_transfer_get_setup :: #force_inline proc(transfer: ^libusb_transfer) -> ^libusb_control_setup {
	return (^libusb_control_setup)(transfer.buffer)
}

libusb_fill_control_setup :: #force_inline proc(
	buffer: ^u8,
	bmRequestType: u8,
	bRequest: u8,
	wValue: u16,
	wIndex: u16,
	wLength: u16,
) {
	setup: ^libusb_control_setup = (^libusb_control_setup)(buffer)
	setup.bmRequestType = bmRequestType
	setup.bRequest = bRequest
	setup.wValue = libusb_cpu_to_le16(wValue)
	setup.wIndex = libusb_cpu_to_le16(wIndex)
	setup.wLength = libusb_cpu_to_le16(wLength)
}

libusb_fill_bulk_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: libusb_device_handle_ptr,
	endpoint: u8,
	buffer: ^u8,
	length: int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = u8(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_BULK)
	transfer.timeout = timeout
	transfer.buffer = buffer
	transfer.length = length
	transfer.user_data = user_data
	transfer.callback = callback
}

libusb_fill_control_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: libusb_device_handle_ptr,
	buffer: ^u8,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: uint,
) {
	setup := (^libusb_control_setup)(buffer)
	transfer.dev_handle = dev_handle
	transfer.endpoint = 0
	transfer.type = u8(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_CONTROL)
	transfer.timeout = timeout
	transfer.buffer = buffer

	if (setup != nil) {
		transfer.length = int(LIBUSB_CONTROL_SETUP_SIZE + libusb_cpu_to_le16(setup.wLength))
	}

	transfer.user_data = user_data
	transfer.callback = callback
}

libusb_fill_bulk_stream_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: libusb_device_handle_ptr,
	endpoint: u8,
	stream_id: u32,
	buffer: ^u8,
	length: int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: uint,
) {
	libusb_fill_bulk_transfer(transfer, dev_handle, endpoint, buffer, length, callback, user_data, timeout)
	transfer.type = u8(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_BULK_STREAM)
	libusb_transfer_set_stream_id(transfer, stream_id)
}

libusb_fill_interrupt_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: libusb_device_handle_ptr,
	endpoint: u8,
	buffer: ^u8,
	length: int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = u8(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_INTERRUPT)
	transfer.timeout = timeout
	transfer.buffer = buffer
	transfer.length = length
	transfer.user_data = user_data
	transfer.callback = callback
}

libusb_fill_iso_transfer :: #force_inline proc(
	transfer: ^libusb_transfer,
	dev_handle: libusb_device_handle_ptr,
	endpoint: u8,
	buffer: ^u8,
	length: int,
	num_iso_packets: int,
	callback: libusb_transfer_cb_fn,
	user_data: rawptr,
	timeout: uint,
) {
	transfer.dev_handle = dev_handle
	transfer.endpoint = endpoint
	transfer.type = u8(libusb_transfer_type.LIBUSB_TRANSFER_TYPE_ISOCHRONOUS)
	transfer.timeout = timeout
	transfer.buffer = buffer
	transfer.length = length
	transfer.num_iso_packets = num_iso_packets
	transfer.user_data = user_data
	transfer.callback = callback
}

libusb_set_iso_packet_lengths :: #force_inline proc(transfer: ^libusb_transfer, length: uint) {
	for i := 0; i < transfer.num_iso_packets; i += 1 {
		transfer.iso_packet_desc[i].length = length
	}
}

libusb_get_iso_packet_buffer :: #force_inline proc(transfer: ^libusb_transfer, packet: uint) -> ^u8 {
	offset: int = 0
	_packet: int
	if (packet > 2147483647) {return nil}
	_packet = int(packet)
	if (_packet >= transfer.num_iso_packets) {return nil}
	for i := 0; i < _packet; i += 1 {offset += int(transfer.iso_packet_desc[i].length)}
	return (^u8)(mem.ptr_offset(transfer.buffer, offset))
}

libusb_get_iso_packet_buffer_simple :: #force_inline proc(transfer: ^libusb_transfer, packet: uint) -> ^u8 {
	_packet: int
	if (packet > 2147483647) {return nil}
	_packet = int(packet)
	if (_packet >= transfer.num_iso_packets) {return nil}
	return (^u8)(mem.ptr_offset(transfer.buffer, (int(transfer.iso_packet_desc[0].length) * _packet)))
}

libusb_get_descriptor :: #force_inline proc(
	dev_handle: libusb_device_handle_ptr,
	desc_type: u8,
	desc_index: u8,
	data: ^u8,
	length: int,
) -> int {
	return libusb_control_transfer(
		dev_handle,
		u8(libusb_endpoint_direction.LIBUSB_ENDPOINT_IN),
		u8(libusb_standard_request.LIBUSB_REQUEST_GET_DESCRIPTOR),
		u16((desc_type << 8) | desc_index),
		0,
		data,
		u16(length),
		1000,
	)
}

libusb_get_string_descriptor :: #force_inline proc(
	dev_handle: libusb_device_handle_ptr,
	desc_index: u8,
	langid: u16,
	data: ^u8,
	length: int,
) -> int {
	return libusb_control_transfer(
		dev_handle,
		u8(libusb_endpoint_direction.LIBUSB_ENDPOINT_IN),
		u8(libusb_standard_request.LIBUSB_REQUEST_GET_DESCRIPTOR),
		u16((u16(libusb_descriptor_type.LIBUSB_DT_STRING) << 8) | u16(desc_index)),
		langid,
		data,
		u16(length),
		1000,
	)
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
LIBUSB_DT_BOS_MAX_SIZE ::
	(LIBUSB_DT_BOS_SIZE +
		LIBUSB_BT_USB_2_0_EXTENSION_SIZE +
		LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE +
		LIBUSB_BT_CONTAINER_ID_SIZE)

LIBUSB_ENDPOINT_ADDRESS_MASK :: 0x0f
LIBUSB_ENDPOINT_DIR_MASK :: 0x80
LIBUSB_TRANSFER_TYPE_MASK :: 0x03
LIBUSB_ISO_SYNC_TYPE_MASK :: 0x0c
LIBUSB_ISO_USAGE_TYPE_MASK :: 0x30
LIBUSB_CONTROL_SETUP_SIZE :: size_of(libusb_control_setup)
LIBUSB_ERROR_COUNT :: 14
LIBUSB_HOTPLUG_NO_FLAGS :: 0
LIBUSB_HOTPLUG_MATCH_ANY :: -1
LIBUSB_OPTION_WEAK_AUTHORITY :: libusb_option.LIBUSB_OPTION_NO_DEVICE_DISCOVERY

libusb_context_ptr :: distinct rawptr
libusb_device_ptr :: distinct rawptr
libusb_device_handle_ptr :: distinct rawptr

timeval :: struct {
	tv_sec:  i64,
	tv_usec: i64,
}

list_head :: struct {
	prev: ^list_head,
	next: ^list_head,
}

libusb_device_descriptor :: struct {
	bLength:            u8,
	bDescriptorType:    u8,
	bcdUSB:             u16,
	bDeviceClass:       u8,
	bDeviceSubClass:    u8,
	bDeviceProtocol:    u8,
	bMaxPacketSize0:    u8,
	idVendor:           u16,
	idProduct:          u16,
	bcdDevice:          u16,
	iManufacturer:      u8,
	iProduct:           u8,
	iSerialNumber:      u8,
	bNumConfigurations: u8,
}

libusb_endpoint_descriptor :: struct {
	bLength:          u8,
	bDescriptorType:  u8,
	bEndpointAddress: u8,
	bmAttributes:     u8,
	wMaxPacketSize:   u16,
	bInterval:        u8,
	bRefresh:         u8,
	bSynchAddress:    u8,
	extra:            ^u8,
	extra_length:     int,
}

libusb_interface_descriptor :: struct {
	bLength:            u8,
	bDescriptorType:    u8,
	bInterfaceNumber:   u8,
	bAlternateSetting:  u8,
	bNumEndpoints:      u8,
	bInterfaceClass:    u8,
	bInterfaceSubClass: u8,
	bInterfaceProtocol: u8,
	iInterface:         u8,
	endpoint:           ^libusb_endpoint_descriptor,
	extra:              ^u8,
	extra_length:       int,
}

libusb_interface :: struct {
	altsetting:     ^libusb_interface_descriptor,
	num_altsetting: int,
}

libusb_config_descriptor :: struct {
	bLength:             u8,
	bDescriptorType:     u8,
	wTotalLength:        u16,
	bNumInterfaces:      u8,
	bConfigurationValue: u8,
	iConfiguration:      u8,
	bmAttributes:        u8,
	MaxPower:            u8,
	interface:           ^libusb_interface,
	extra:               ^u8,
	extra_length:        int,
}

libusb_ss_endpoint_companion_descriptor :: struct {
	bLength:           u8,
	bDescriptorType:   u8,
	bMaxBurst:         u8,
	bmAttributes:      u8,
	wBytesPerInterval: u16,
}

libusb_bos_dev_capability_descriptor :: struct {
	bLength:             u8,
	bDescriptorType:     u8,
	bDevCapabilityType:  u8,
	dev_capability_data: [^]u8,
}

libusb_bos_descriptor :: struct {
	bLength:         u8,
	bDescriptorType: u8,
	wTotalLength:    u16,
	bNumDeviceCaps:  u8,
	dev_capability:  [^]^libusb_bos_dev_capability_descriptor,
}

libusb_usb_2_0_extension_descriptor :: struct {
	bLength:            u8,
	bDescriptorType:    u8,
	bDevCapabilityType: u8,
	bmAttributes:       u32,
}

libusb_ss_usb_device_capability_descriptor :: struct {
	bLength:               u8,
	bDescriptorType:       u8,
	bDevCapabilityType:    u8,
	bmAttributes:          u8,
	wSpeedSupported:       u16,
	bFunctionalitySupport: u8,
	bU1DevExitLat:         u8,
	bU2DevExitLat:         u16,
}

libusb_container_id_descriptor :: struct {
	bLength:            u8,
	bDescriptorType:    u8,
	bDevCapabilityType: u8,
	bReserved:          u8,
	ContainerID:        [16]u8,
}

libusb_control_setup :: struct {
	bmRequestType: u8,
	bRequest:      u8,
	wValue:        u16,
	wIndex:        u16,
	wLength:       u16,
}

libusb_version :: struct {
	major:    u16,
	minor:    u16,
	micro:    u16,
	nano:     u16,
	rc:       cstring,
	describe: cstring,
}

libusb_iso_packet_descriptor :: struct {
	length:        uint,
	actual_length: uint,
	status:        libusb_transfer_status,
}

libusb_transfer :: struct {
	dev_handle:      libusb_device_handle_ptr,
	flags:           u8,
	endpoint:        u8,
	type:            u8,
	timeout:         uint,
	status:          libusb_transfer_status,
	length:          int,
	actual_length:   int,
	callback:        libusb_transfer_cb_fn,
	user_data:       rawptr,
	buffer:          ^u8,
	num_iso_packets: int,
	iso_packet_desc: [^]libusb_iso_packet_descriptor,
}

libusb_pollfd :: struct {
	fd:     int,
	events: i16,
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
	NONE                       = 0,
	LIBUSB_SUCCESS             = 0,
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
	LIBUSB_TRANSFER_SHORT_NOT_OK    = (1 << 0),
	LIBUSB_TRANSFER_FREE_BUFFER     = (1 << 1),
	LIBUSB_TRANSFER_FREE_TRANSFER   = (1 << 2),
	LIBUSB_TRANSFER_ADD_ZERO_PACKET = (1 << 3),
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

libusb_hotplug_flag :: enum {
	LIBUSB_HOTPLUG_ENUMERATE = (1 << 0),
}
