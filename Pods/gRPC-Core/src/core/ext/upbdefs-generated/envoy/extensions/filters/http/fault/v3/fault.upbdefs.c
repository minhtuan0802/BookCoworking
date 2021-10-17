/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/extensions/filters/http/fault/v3/fault.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#if COCOAPODS==1
  #include  "third_party/upb/upb/def.h"
#else
  #include  "upb/def.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upbdefs-generated/envoy/extensions/filters/http/fault/v3/fault.upbdefs.h"
#else
  #include  "envoy/extensions/filters/http/fault/v3/fault.upbdefs.h"
#endif

extern upb_def_init envoy_config_route_v3_route_components_proto_upbdefinit;
extern upb_def_init envoy_extensions_filters_common_fault_v3_fault_proto_upbdefinit;
extern upb_def_init envoy_type_v3_percent_proto_upbdefinit;
extern upb_def_init google_protobuf_wrappers_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern upb_def_init udpa_annotations_versioning_proto_upbdefinit;
extern upb_def_init validate_validate_proto_upbdefinit;
extern const upb_msglayout envoy_extensions_filters_http_fault_v3_FaultAbort_msginit;
extern const upb_msglayout envoy_extensions_filters_http_fault_v3_FaultAbort_HeaderAbort_msginit;
extern const upb_msglayout envoy_extensions_filters_http_fault_v3_HTTPFault_msginit;

static const upb_msglayout *layouts[3] = {
  &envoy_extensions_filters_http_fault_v3_FaultAbort_msginit,
  &envoy_extensions_filters_http_fault_v3_FaultAbort_HeaderAbort_msginit,
  &envoy_extensions_filters_http_fault_v3_HTTPFault_msginit,
};

static const char descriptor[1885] = {'\n', '2', 'e', 'n', 'v', 'o', 'y', '/', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '/', 'f', 'i', 'l', 't', 'e', 'r', 
's', '/', 'h', 't', 't', 'p', '/', 'f', 'a', 'u', 'l', 't', '/', 'v', '3', '/', 'f', 'a', 'u', 'l', 't', '.', 'p', 'r', 'o', 
't', 'o', '\022', '&', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 
'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'f', 'a', 'u', 'l', 't', '.', 'v', '3', '\032', ',', 'e', 'n', 'v', 'o', 'y', '/', 
'c', 'o', 'n', 'f', 'i', 'g', '/', 'r', 'o', 'u', 't', 'e', '/', 'v', '3', '/', 'r', 'o', 'u', 't', 'e', '_', 'c', 'o', 'm', 
'p', 'o', 'n', 'e', 'n', 't', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '4', 'e', 'n', 'v', 'o', 'y', '/', 'e', 'x', 't', 'e', 
'n', 's', 'i', 'o', 'n', 's', '/', 'f', 'i', 'l', 't', 'e', 'r', 's', '/', 'c', 'o', 'm', 'm', 'o', 'n', '/', 'f', 'a', 'u', 
'l', 't', '/', 'v', '3', '/', 'f', 'a', 'u', 'l', 't', '.', 'p', 'r', 'o', 't', 'o', '\032', '\033', 'e', 'n', 'v', 'o', 'y', '/', 
't', 'y', 'p', 'e', '/', 'v', '3', '/', 'p', 'e', 'r', 'c', 'e', 'n', 't', '.', 'p', 'r', 'o', 't', 'o', '\032', '\036', 'g', 'o', 
'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 'w', 'r', 'a', 'p', 'p', 'e', 'r', 's', '.', 'p', 'r', 
'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 
't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '!', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 
'n', 's', '/', 'v', 'e', 'r', 's', 'i', 'o', 'n', 'i', 'n', 'g', '.', 'p', 'r', 'o', 't', 'o', '\032', '\027', 'v', 'a', 'l', 'i', 
'd', 'a', 't', 'e', '/', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '.', 'p', 'r', 'o', 't', 'o', '\"', '\244', '\003', '\n', '\n', 'F', 
'a', 'u', 'l', 't', 'A', 'b', 'o', 'r', 't', '\022', '.', '\n', '\013', 'h', 't', 't', 'p', '_', 's', 't', 'a', 't', 'u', 's', '\030', 
'\002', ' ', '\001', '(', '\r', 'B', '\013', '\372', 'B', '\010', '*', '\006', '\020', '\330', '\004', '(', '\310', '\001', 'H', '\000', 'R', '\n', 'h', 't', 't', 
'p', 'S', 't', 'a', 't', 'u', 's', '\022', '!', '\n', '\013', 'g', 'r', 'p', 'c', '_', 's', 't', 'a', 't', 'u', 's', '\030', '\005', ' ', 
'\001', '(', '\r', 'H', '\000', 'R', '\n', 'g', 'r', 'p', 'c', 'S', 't', 'a', 't', 'u', 's', '\022', 'c', '\n', '\014', 'h', 'e', 'a', 'd', 
'e', 'r', '_', 'a', 'b', 'o', 'r', 't', '\030', '\004', ' ', '\001', '(', '\013', '2', '>', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 
't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'f', 'a', 'u', 
'l', 't', '.', 'v', '3', '.', 'F', 'a', 'u', 'l', 't', 'A', 'b', 'o', 'r', 't', '.', 'H', 'e', 'a', 'd', 'e', 'r', 'A', 'b', 
'o', 'r', 't', 'H', '\000', 'R', '\013', 'h', 'e', 'a', 'd', 'e', 'r', 'A', 'b', 'o', 'r', 't', '\022', '@', '\n', '\n', 'p', 'e', 'r', 
'c', 'e', 'n', 't', 'a', 'g', 'e', '\030', '\003', ' ', '\001', '(', '\013', '2', ' ', '.', 'e', 'n', 'v', 'o', 'y', '.', 't', 'y', 'p', 
'e', '.', 'v', '3', '.', 'F', 'r', 'a', 'c', 't', 'i', 'o', 'n', 'a', 'l', 'P', 'e', 'r', 'c', 'e', 'n', 't', 'R', '\n', 'p', 
'e', 'r', 'c', 'e', 'n', 't', 'a', 'g', 'e', '\032', 'N', '\n', '\013', 'H', 'e', 'a', 'd', 'e', 'r', 'A', 'b', 'o', 'r', 't', ':', 
'?', '\232', '\305', '\210', '\036', ':', '\n', '8', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'f', 'i', 'l', 't', 
'e', 'r', '.', 'h', 't', 't', 'p', '.', 'f', 'a', 'u', 'l', 't', '.', 'v', '2', '.', 'F', 'a', 'u', 'l', 't', 'A', 'b', 'o', 
'r', 't', '.', 'H', 'e', 'a', 'd', 'e', 'r', 'A', 'b', 'o', 'r', 't', ':', '3', '\232', '\305', '\210', '\036', '.', '\n', ',', 'e', 'n', 
'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'f', 'i', 'l', 't', 'e', 'r', '.', 'h', 't', 't', 'p', '.', 'f', 'a', 
'u', 'l', 't', '.', 'v', '2', '.', 'F', 'a', 'u', 'l', 't', 'A', 'b', 'o', 'r', 't', 'B', '\021', '\n', '\n', 'e', 'r', 'r', 'o', 
'r', '_', 't', 'y', 'p', 'e', '\022', '\003', '\370', 'B', '\001', 'J', '\004', '\010', '\001', '\020', '\002', '\"', '\205', '\010', '\n', '\t', 'H', 'T', 'T', 
'P', 'F', 'a', 'u', 'l', 't', '\022', 'J', '\n', '\005', 'd', 'e', 'l', 'a', 'y', '\030', '\001', ' ', '\001', '(', '\013', '2', '4', '.', 'e', 
'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'c', 
'o', 'm', 'm', 'o', 'n', '.', 'f', 'a', 'u', 'l', 't', '.', 'v', '3', '.', 'F', 'a', 'u', 'l', 't', 'D', 'e', 'l', 'a', 'y', 
'R', '\005', 'd', 'e', 'l', 'a', 'y', '\022', 'H', '\n', '\005', 'a', 'b', 'o', 'r', 't', '\030', '\002', ' ', '\001', '(', '\013', '2', '2', '.', 
'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 
'h', 't', 't', 'p', '.', 'f', 'a', 'u', 'l', 't', '.', 'v', '3', '.', 'F', 'a', 'u', 'l', 't', 'A', 'b', 'o', 'r', 't', 'R', 
'\005', 'a', 'b', 'o', 'r', 't', '\022', ')', '\n', '\020', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', '_', 'c', 'l', 'u', 's', 't', 'e', 
'r', '\030', '\003', ' ', '\001', '(', '\t', 'R', '\017', 'u', 'p', 's', 't', 'r', 'e', 'a', 'm', 'C', 'l', 'u', 's', 't', 'e', 'r', '\022', 
'>', '\n', '\007', 'h', 'e', 'a', 'd', 'e', 'r', 's', '\030', '\004', ' ', '\003', '(', '\013', '2', '$', '.', 'e', 'n', 'v', 'o', 'y', '.', 
'c', 'o', 'n', 'f', 'i', 'g', '.', 'r', 'o', 'u', 't', 'e', '.', 'v', '3', '.', 'H', 'e', 'a', 'd', 'e', 'r', 'M', 'a', 't', 
'c', 'h', 'e', 'r', 'R', '\007', 'h', 'e', 'a', 'd', 'e', 'r', 's', '\022', ')', '\n', '\020', 'd', 'o', 'w', 'n', 's', 't', 'r', 'e', 
'a', 'm', '_', 'n', 'o', 'd', 'e', 's', '\030', '\005', ' ', '\003', '(', '\t', 'R', '\017', 'd', 'o', 'w', 'n', 's', 't', 'r', 'e', 'a', 
'm', 'N', 'o', 'd', 'e', 's', '\022', 'H', '\n', '\021', 'm', 'a', 'x', '_', 'a', 'c', 't', 'i', 'v', 'e', '_', 'f', 'a', 'u', 'l', 
't', 's', '\030', '\006', ' ', '\001', '(', '\013', '2', '\034', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 
'f', '.', 'U', 'I', 'n', 't', '3', '2', 'V', 'a', 'l', 'u', 'e', 'R', '\017', 'm', 'a', 'x', 'A', 'c', 't', 'i', 'v', 'e', 'F', 
'a', 'u', 'l', 't', 's', '\022', 'h', '\n', '\023', 'r', 'e', 's', 'p', 'o', 'n', 's', 'e', '_', 'r', 'a', 't', 'e', '_', 'l', 'i', 
'm', 'i', 't', '\030', '\007', ' ', '\001', '(', '\013', '2', '8', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 't', 'e', 'n', 's', 'i', 
'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'c', 'o', 'm', 'm', 'o', 'n', '.', 'f', 'a', 'u', 'l', 't', '.', 
'v', '3', '.', 'F', 'a', 'u', 'l', 't', 'R', 'a', 't', 'e', 'L', 'i', 'm', 'i', 't', 'R', '\021', 'r', 'e', 's', 'p', 'o', 'n', 
's', 'e', 'R', 'a', 't', 'e', 'L', 'i', 'm', 'i', 't', '\022', '2', '\n', '\025', 'd', 'e', 'l', 'a', 'y', '_', 'p', 'e', 'r', 'c', 
'e', 'n', 't', '_', 'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\010', ' ', '\001', '(', '\t', 'R', '\023', 'd', 'e', 'l', 'a', 'y', 'P', 
'e', 'r', 'c', 'e', 'n', 't', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', '2', '\n', '\025', 'a', 'b', 'o', 'r', 't', '_', 'p', 'e', 
'r', 'c', 'e', 'n', 't', '_', 'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\t', ' ', '\001', '(', '\t', 'R', '\023', 'a', 'b', 'o', 'r', 
't', 'P', 'e', 'r', 'c', 'e', 'n', 't', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', '4', '\n', '\026', 'd', 'e', 'l', 'a', 'y', '_', 
'd', 'u', 'r', 'a', 't', 'i', 'o', 'n', '_', 'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\n', ' ', '\001', '(', '\t', 'R', '\024', 'd', 
'e', 'l', 'a', 'y', 'D', 'u', 'r', 'a', 't', 'i', 'o', 'n', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', '9', '\n', '\031', 'a', 'b', 
'o', 'r', 't', '_', 'h', 't', 't', 'p', '_', 's', 't', 'a', 't', 'u', 's', '_', 'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\013', 
' ', '\001', '(', '\t', 'R', '\026', 'a', 'b', 'o', 'r', 't', 'H', 't', 't', 'p', 'S', 't', 'a', 't', 'u', 's', 'R', 'u', 'n', 't', 
'i', 'm', 'e', '\022', '9', '\n', '\031', 'm', 'a', 'x', '_', 'a', 'c', 't', 'i', 'v', 'e', '_', 'f', 'a', 'u', 'l', 't', 's', '_', 
'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\014', ' ', '\001', '(', '\t', 'R', '\026', 'm', 'a', 'x', 'A', 'c', 't', 'i', 'v', 'e', 'F', 
'a', 'u', 'l', 't', 's', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', 'L', '\n', '#', 'r', 'e', 's', 'p', 'o', 'n', 's', 'e', '_', 
'r', 'a', 't', 'e', '_', 'l', 'i', 'm', 'i', 't', '_', 'p', 'e', 'r', 'c', 'e', 'n', 't', '_', 'r', 'u', 'n', 't', 'i', 'm', 
'e', '\030', '\r', ' ', '\001', '(', '\t', 'R', '\037', 'r', 'e', 's', 'p', 'o', 'n', 's', 'e', 'R', 'a', 't', 'e', 'L', 'i', 'm', 'i', 
't', 'P', 'e', 'r', 'c', 'e', 'n', 't', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', '9', '\n', '\031', 'a', 'b', 'o', 'r', 't', '_', 
'g', 'r', 'p', 'c', '_', 's', 't', 'a', 't', 'u', 's', '_', 'r', 'u', 'n', 't', 'i', 'm', 'e', '\030', '\016', ' ', '\001', '(', '\t', 
'R', '\026', 'a', 'b', 'o', 'r', 't', 'G', 'r', 'p', 'c', 'S', 't', 'a', 't', 'u', 's', 'R', 'u', 'n', 't', 'i', 'm', 'e', '\022', 
'G', '\n', ' ', 'd', 'i', 's', 'a', 'b', 'l', 'e', '_', 'd', 'o', 'w', 'n', 's', 't', 'r', 'e', 'a', 'm', '_', 'c', 'l', 'u', 
's', 't', 'e', 'r', '_', 's', 't', 'a', 't', 's', '\030', '\017', ' ', '\001', '(', '\010', 'R', '\035', 'd', 'i', 's', 'a', 'b', 'l', 'e', 
'D', 'o', 'w', 'n', 's', 't', 'r', 'e', 'a', 'm', 'C', 'l', 'u', 's', 't', 'e', 'r', 'S', 't', 'a', 't', 's', ':', '2', '\232', 
'\305', '\210', '\036', '-', '\n', '+', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'f', 'i', 'l', 't', 'e', 'r', 
'.', 'h', 't', 't', 'p', '.', 'f', 'a', 'u', 'l', 't', '.', 'v', '2', '.', 'H', 'T', 'T', 'P', 'F', 'a', 'u', 'l', 't', 'B', 
'L', '\n', '4', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 'e', 'x', 
't', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', 'f', 'i', 'l', 't', 'e', 'r', 's', '.', 'h', 't', 't', 'p', '.', 'f', 'a', 'u', 
'l', 't', '.', 'v', '3', 'B', '\n', 'F', 'a', 'u', 'l', 't', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\272', '\200', '\310', '\321', '\006', '\002', 
'\020', '\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[8] = {
  &envoy_config_route_v3_route_components_proto_upbdefinit,
  &envoy_extensions_filters_common_fault_v3_fault_proto_upbdefinit,
  &envoy_type_v3_percent_proto_upbdefinit,
  &google_protobuf_wrappers_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &udpa_annotations_versioning_proto_upbdefinit,
  &validate_validate_proto_upbdefinit,
  NULL
};

upb_def_init envoy_extensions_filters_http_fault_v3_fault_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/extensions/filters/http/fault/v3/fault.proto",
  UPB_STRVIEW_INIT(descriptor, 1885)
};
