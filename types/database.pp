# @since 2.0.0
type Grafana::Database = Variant[Grafana::Database::SQLite, Grafana::Database::MySQL, Grafana::Database::PostgreSQL]
