/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/listener/v3/quic_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_CONFIG_LISTENER_V3_QUIC_CONFIG_PROTO_UPB_H_
#define ENVOY_CONFIG_LISTENER_V3_QUIC_CONFIG_PROTO_UPB_H_

#if COCOAPODS==1
  #include  "third_party/upb/upb/msg.h"
#else
  #include  "upb/msg.h"
#endif
#if COCOAPODS==1
  #include  "third_party/upb/upb/decode.h"
#else
  #include  "upb/decode.h"
#endif
#if COCOAPODS==1
  #include  "third_party/upb/upb/decode_fast.h"
#else
  #include  "upb/decode_fast.h"
#endif
#if COCOAPODS==1
  #include  "third_party/upb/upb/encode.h"
#else
  #include  "upb/encode.h"
#endif

#if COCOAPODS==1
  #include  "third_party/upb/upb/port_def.inc"
#else
  #include  "upb/port_def.inc"
#endif

#ifdef __cplusplus
extern "C" {
#endif

struct envoy_config_listener_v3_QuicProtocolOptions;
typedef struct envoy_config_listener_v3_QuicProtocolOptions envoy_config_listener_v3_QuicProtocolOptions;
extern const upb_msglayout envoy_config_listener_v3_QuicProtocolOptions_msginit;
struct envoy_config_core_v3_QuicProtocolOptions;
struct envoy_config_core_v3_RuntimeFeatureFlag;
struct envoy_config_core_v3_TypedExtensionConfig;
struct google_protobuf_Duration;
struct google_protobuf_UInt32Value;
extern const upb_msglayout envoy_config_core_v3_QuicProtocolOptions_msginit;
extern const upb_msglayout envoy_config_core_v3_RuntimeFeatureFlag_msginit;
extern const upb_msglayout envoy_config_core_v3_TypedExtensionConfig_msginit;
extern const upb_msglayout google_protobuf_Duration_msginit;
extern const upb_msglayout google_protobuf_UInt32Value_msginit;


/* envoy.config.listener.v3.QuicProtocolOptions */

UPB_INLINE envoy_config_listener_v3_QuicProtocolOptions *envoy_config_listener_v3_QuicProtocolOptions_new(upb_arena *arena) {
  return (envoy_config_listener_v3_QuicProtocolOptions *)_upb_msg_new(&envoy_config_listener_v3_QuicProtocolOptions_msginit, arena);
}
UPB_INLINE envoy_config_listener_v3_QuicProtocolOptions *envoy_config_listener_v3_QuicProtocolOptions_parse(const char *buf, size_t size,
                        upb_arena *arena) {
  envoy_config_listener_v3_QuicProtocolOptions *ret = envoy_config_listener_v3_QuicProtocolOptions_new(arena);
  return (ret && upb_decode(buf, size, ret, &envoy_config_listener_v3_QuicProtocolOptions_msginit, arena)) ? ret : NULL;
}
UPB_INLINE envoy_config_listener_v3_QuicProtocolOptions *envoy_config_listener_v3_QuicProtocolOptions_parse_ex(const char *buf, size_t size,
                           upb_arena *arena, int options) {
  envoy_config_listener_v3_QuicProtocolOptions *ret = envoy_config_listener_v3_QuicProtocolOptions_new(arena);
  return (ret && _upb_decode(buf, size, ret, &envoy_config_listener_v3_QuicProtocolOptions_msginit, arena, options))
      ? ret : NULL;
}
UPB_INLINE char *envoy_config_listener_v3_QuicProtocolOptions_serialize(const envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena, size_t *len) {
  return upb_encode(msg, &envoy_config_listener_v3_QuicProtocolOptions_msginit, arena, len);
}

UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_quic_protocol_options(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 1); }
UPB_INLINE const struct envoy_config_core_v3_QuicProtocolOptions* envoy_config_listener_v3_QuicProtocolOptions_quic_protocol_options(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(4, 8), const struct envoy_config_core_v3_QuicProtocolOptions*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_idle_timeout(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 2); }
UPB_INLINE const struct google_protobuf_Duration* envoy_config_listener_v3_QuicProtocolOptions_idle_timeout(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(8, 16), const struct google_protobuf_Duration*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_crypto_handshake_timeout(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 3); }
UPB_INLINE const struct google_protobuf_Duration* envoy_config_listener_v3_QuicProtocolOptions_crypto_handshake_timeout(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(12, 24), const struct google_protobuf_Duration*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_enabled(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 4); }
UPB_INLINE const struct envoy_config_core_v3_RuntimeFeatureFlag* envoy_config_listener_v3_QuicProtocolOptions_enabled(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(16, 32), const struct envoy_config_core_v3_RuntimeFeatureFlag*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_packets_to_read_to_connection_count_ratio(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 5); }
UPB_INLINE const struct google_protobuf_UInt32Value* envoy_config_listener_v3_QuicProtocolOptions_packets_to_read_to_connection_count_ratio(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(20, 40), const struct google_protobuf_UInt32Value*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_crypto_stream_config(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 6); }
UPB_INLINE const struct envoy_config_core_v3_TypedExtensionConfig* envoy_config_listener_v3_QuicProtocolOptions_crypto_stream_config(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(24, 48), const struct envoy_config_core_v3_TypedExtensionConfig*); }
UPB_INLINE bool envoy_config_listener_v3_QuicProtocolOptions_has_proof_source_config(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return _upb_hasbit(msg, 7); }
UPB_INLINE const struct envoy_config_core_v3_TypedExtensionConfig* envoy_config_listener_v3_QuicProtocolOptions_proof_source_config(const envoy_config_listener_v3_QuicProtocolOptions *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(28, 56), const struct envoy_config_core_v3_TypedExtensionConfig*); }

UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_quic_protocol_options(envoy_config_listener_v3_QuicProtocolOptions *msg, struct envoy_config_core_v3_QuicProtocolOptions* value) {
  _upb_sethas(msg, 1);
  *UPB_PTR_AT(msg, UPB_SIZE(4, 8), struct envoy_config_core_v3_QuicProtocolOptions*) = value;
}
UPB_INLINE struct envoy_config_core_v3_QuicProtocolOptions* envoy_config_listener_v3_QuicProtocolOptions_mutable_quic_protocol_options(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct envoy_config_core_v3_QuicProtocolOptions* sub = (struct envoy_config_core_v3_QuicProtocolOptions*)envoy_config_listener_v3_QuicProtocolOptions_quic_protocol_options(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_QuicProtocolOptions*)_upb_msg_new(&envoy_config_core_v3_QuicProtocolOptions_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_quic_protocol_options(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_idle_timeout(envoy_config_listener_v3_QuicProtocolOptions *msg, struct google_protobuf_Duration* value) {
  _upb_sethas(msg, 2);
  *UPB_PTR_AT(msg, UPB_SIZE(8, 16), struct google_protobuf_Duration*) = value;
}
UPB_INLINE struct google_protobuf_Duration* envoy_config_listener_v3_QuicProtocolOptions_mutable_idle_timeout(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct google_protobuf_Duration* sub = (struct google_protobuf_Duration*)envoy_config_listener_v3_QuicProtocolOptions_idle_timeout(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_Duration*)_upb_msg_new(&google_protobuf_Duration_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_idle_timeout(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_crypto_handshake_timeout(envoy_config_listener_v3_QuicProtocolOptions *msg, struct google_protobuf_Duration* value) {
  _upb_sethas(msg, 3);
  *UPB_PTR_AT(msg, UPB_SIZE(12, 24), struct google_protobuf_Duration*) = value;
}
UPB_INLINE struct google_protobuf_Duration* envoy_config_listener_v3_QuicProtocolOptions_mutable_crypto_handshake_timeout(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct google_protobuf_Duration* sub = (struct google_protobuf_Duration*)envoy_config_listener_v3_QuicProtocolOptions_crypto_handshake_timeout(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_Duration*)_upb_msg_new(&google_protobuf_Duration_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_crypto_handshake_timeout(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_enabled(envoy_config_listener_v3_QuicProtocolOptions *msg, struct envoy_config_core_v3_RuntimeFeatureFlag* value) {
  _upb_sethas(msg, 4);
  *UPB_PTR_AT(msg, UPB_SIZE(16, 32), struct envoy_config_core_v3_RuntimeFeatureFlag*) = value;
}
UPB_INLINE struct envoy_config_core_v3_RuntimeFeatureFlag* envoy_config_listener_v3_QuicProtocolOptions_mutable_enabled(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct envoy_config_core_v3_RuntimeFeatureFlag* sub = (struct envoy_config_core_v3_RuntimeFeatureFlag*)envoy_config_listener_v3_QuicProtocolOptions_enabled(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_RuntimeFeatureFlag*)_upb_msg_new(&envoy_config_core_v3_RuntimeFeatureFlag_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_enabled(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_packets_to_read_to_connection_count_ratio(envoy_config_listener_v3_QuicProtocolOptions *msg, struct google_protobuf_UInt32Value* value) {
  _upb_sethas(msg, 5);
  *UPB_PTR_AT(msg, UPB_SIZE(20, 40), struct google_protobuf_UInt32Value*) = value;
}
UPB_INLINE struct google_protobuf_UInt32Value* envoy_config_listener_v3_QuicProtocolOptions_mutable_packets_to_read_to_connection_count_ratio(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct google_protobuf_UInt32Value* sub = (struct google_protobuf_UInt32Value*)envoy_config_listener_v3_QuicProtocolOptions_packets_to_read_to_connection_count_ratio(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_UInt32Value*)_upb_msg_new(&google_protobuf_UInt32Value_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_packets_to_read_to_connection_count_ratio(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_crypto_stream_config(envoy_config_listener_v3_QuicProtocolOptions *msg, struct envoy_config_core_v3_TypedExtensionConfig* value) {
  _upb_sethas(msg, 6);
  *UPB_PTR_AT(msg, UPB_SIZE(24, 48), struct envoy_config_core_v3_TypedExtensionConfig*) = value;
}
UPB_INLINE struct envoy_config_core_v3_TypedExtensionConfig* envoy_config_listener_v3_QuicProtocolOptions_mutable_crypto_stream_config(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct envoy_config_core_v3_TypedExtensionConfig* sub = (struct envoy_config_core_v3_TypedExtensionConfig*)envoy_config_listener_v3_QuicProtocolOptions_crypto_stream_config(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_TypedExtensionConfig*)_upb_msg_new(&envoy_config_core_v3_TypedExtensionConfig_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_crypto_stream_config(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_listener_v3_QuicProtocolOptions_set_proof_source_config(envoy_config_listener_v3_QuicProtocolOptions *msg, struct envoy_config_core_v3_TypedExtensionConfig* value) {
  _upb_sethas(msg, 7);
  *UPB_PTR_AT(msg, UPB_SIZE(28, 56), struct envoy_config_core_v3_TypedExtensionConfig*) = value;
}
UPB_INLINE struct envoy_config_core_v3_TypedExtensionConfig* envoy_config_listener_v3_QuicProtocolOptions_mutable_proof_source_config(envoy_config_listener_v3_QuicProtocolOptions *msg, upb_arena *arena) {
  struct envoy_config_core_v3_TypedExtensionConfig* sub = (struct envoy_config_core_v3_TypedExtensionConfig*)envoy_config_listener_v3_QuicProtocolOptions_proof_source_config(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_TypedExtensionConfig*)_upb_msg_new(&envoy_config_core_v3_TypedExtensionConfig_msginit, arena);
    if (!sub) return NULL;
    envoy_config_listener_v3_QuicProtocolOptions_set_proof_source_config(msg, sub);
  }
  return sub;
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#if COCOAPODS==1
  #include  "third_party/upb/upb/port_undef.inc"
#else
  #include  "upb/port_undef.inc"
#endif

#endif  /* ENVOY_CONFIG_LISTENER_V3_QUIC_CONFIG_PROTO_UPB_H_ */