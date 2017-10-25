# @since 2.0.0
type Grafana::Database::MySQL = Struct[{NotUndef['type'] => Enum['mysql'], Optional['host'] => Tuple[Bodgitlib::Host, Bodgitlib::Port], Optional['user'] => String, Optional['password'] => String, Optional['name'] => String, Optional['ssl_mode'] => Variant[Boolean, Enum['true', 'false', 'skip-verify']], Optional['ca_cert_path'] => Stdlib::Absolutepath, Optional['client_key_path'] => Stdlib::Absolutepath, Optional['client_cert_path'] => Stdlib::Absolutepath, Optional['server_cert_name'] => String}]
