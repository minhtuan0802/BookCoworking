/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/core/v3/resolver.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#if COCOAPODS==1
  #include  "third_party/upb/upb/def.h"
#else
  #include  "upb/def.h"
#endif
#if COCOAPODS==1
  #include  "src/core/ext/upbdefs-generated/envoy/config/core/v3/resolver.upbdefs.h"
#else
  #include  "envoy/config/core/v3/resolver.upbdefs.h"
#endif

extern upb_def_init envoy_config_core_v3_address_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern upb_def_init validate_validate_proto_upbdefinit;
extern const upb_msglayout envoy_config_core_v3_DnsResolverOptions_msginit;
extern const upb_msglayout envoy_config_core_v3_DnsResolutionConfig_msginit;

static const upb_msglayout *layouts[2] = {
  &envoy_config_core_v3_DnsResolverOptions_msginit,
  &envoy_config_core_v3_DnsResolutionConfig_msginit,
};

static const char descriptor[543] = {'\n', '#', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'c', 'o', 'r', 'e', '/', 'v', '3', '/', 'r', 'e', 
's', 'o', 'l', 'v', 'e', 'r', '.', 'p', 'r', 'o', 't', 'o', '\022', '\024', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 
'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '\032', '\"', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'c', 
'o', 'r', 'e', '/', 'v', '3', '/', 'a', 'd', 'd', 'r', 'e', 's', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 
'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 
'o', '\032', '\027', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '/', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '.', 'p', 'r', 'o', 't', 
'o', '\"', '\203', '\001', '\n', '\022', 'D', 'n', 's', 'R', 'e', 's', 'o', 'l', 'v', 'e', 'r', 'O', 'p', 't', 'i', 'o', 'n', 's', '\022', 
'4', '\n', '\027', 'u', 's', 'e', '_', 't', 'c', 'p', '_', 'f', 'o', 'r', '_', 'd', 'n', 's', '_', 'l', 'o', 'o', 'k', 'u', 'p', 
's', '\030', '\001', ' ', '\001', '(', '\010', 'R', '\023', 'u', 's', 'e', 'T', 'c', 'p', 'F', 'o', 'r', 'D', 'n', 's', 'L', 'o', 'o', 'k', 
'u', 'p', 's', '\022', '7', '\n', '\030', 'n', 'o', '_', 'd', 'e', 'f', 'a', 'u', 'l', 't', '_', 's', 'e', 'a', 'r', 'c', 'h', '_', 
'd', 'o', 'm', 'a', 'i', 'n', '\030', '\002', ' ', '\001', '(', '\010', 'R', '\025', 'n', 'o', 'D', 'e', 'f', 'a', 'u', 'l', 't', 'S', 'e', 
'a', 'r', 'c', 'h', 'D', 'o', 'm', 'a', 'i', 'n', '\"', '\270', '\001', '\n', '\023', 'D', 'n', 's', 'R', 'e', 's', 'o', 'l', 'u', 't', 
'i', 'o', 'n', 'C', 'o', 'n', 'f', 'i', 'g', '\022', 'E', '\n', '\t', 'r', 'e', 's', 'o', 'l', 'v', 'e', 'r', 's', '\030', '\001', ' ', 
'\003', '(', '\013', '2', '\035', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', 
'3', '.', 'A', 'd', 'd', 'r', 'e', 's', 's', 'B', '\010', '\372', 'B', '\005', '\222', '\001', '\002', '\010', '\001', 'R', '\t', 'r', 'e', 's', 'o', 
'l', 'v', 'e', 'r', 's', '\022', 'Z', '\n', '\024', 'd', 'n', 's', '_', 'r', 'e', 's', 'o', 'l', 'v', 'e', 'r', '_', 'o', 'p', 't', 
'i', 'o', 'n', 's', '\030', '\002', ' ', '\001', '(', '\013', '2', '(', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', 
'.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'D', 'n', 's', 'R', 'e', 's', 'o', 'l', 'v', 'e', 'r', 'O', 'p', 't', 'i', 'o', 
'n', 's', 'R', '\022', 'd', 'n', 's', 'R', 'e', 's', 'o', 'l', 'v', 'e', 'r', 'O', 'p', 't', 'i', 'o', 'n', 's', 'B', '=', '\n', 
'\"', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 
'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', 'B', '\r', 'R', 'e', 's', 'o', 'l', 'v', 'e', 'r', 'P', 'r', 'o', 't', 'o', 
'P', '\001', '\272', '\200', '\310', '\321', '\006', '\002', '\020', '\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[4] = {
  &envoy_config_core_v3_address_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &validate_validate_proto_upbdefinit,
  NULL
};

upb_def_init envoy_config_core_v3_resolver_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/config/core/v3/resolver.proto",
  UPB_STRVIEW_INIT(descriptor, 543)
};
