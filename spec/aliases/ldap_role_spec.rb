require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::ldap::role', type: :class do
    describe 'accepts an LDAP role' do
      [
        {
          'group_dn' => 'example',
          'org_role' => 'Admin',
        },
        {
          'group_dn' => 'example',
          'org_role' => 'Editor',
        },
        {
          'group_dn' => 'example',
          'org_role' => 'Read Only Editor',
        },
        {
          'group_dn' => 'example',
          'org_role' => 'Viewer',
        },
        {
          'group_dn' => 'example',
          'org_role' => 'Admin',
          'org_id'   => 1,
        },
      ].each do |value|
        describe value.inspect do
          let(:params) {{ value: value }}
          it { is_expected.to compile }
        end
      end
    end
    describe 'rejects other values' do
      [
        {
          'group_dn' => 'example',
          'org_role' => 'invalid',
        },
        'invalid',
        123,
      ].each do |value|
        describe value.inspect do
          let(:params) {{ value: value }}
          it {is_expected.to compile.and_raise_error(/parameter 'value' /) }
        end
      end
    end
  end
end
