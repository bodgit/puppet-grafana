# @since 2.0.0
type Grafana::Database::PostgreSQL = Struct[{NotUndef['type'] => Enum['postgres'], NotUndef['host'] => Variant[Bodgitlib::Host, Tuple[Bodgitlib::Host, Bodgitlib::Port]], Optional['user'] => String, Optional['password'] => String, Optional['name'] => String, Optional['ssl_mode'] => Enum['disable', 'require', 'verify-full']}]
