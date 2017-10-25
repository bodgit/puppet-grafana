# @since 2.0.0
type Grafana::LDAP::Role = Struct[{NotUndef['group_dn'] => String, NotUndef['org_role'] => Enum['Admin', 'Editor', 'Read Only Editor', 'Viewer'], Optional['org_id'] => Integer[1]}]
