# @since 2.0.0
type Grafana::Database::SQLite = Strict[{NotUndef['type'] => Enum['sqlite3'], Optional['path'] => String}]
