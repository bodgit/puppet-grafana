require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::ldap::attributes', type: :class do
    describe 'accepts an LDAP attribute mapping' do
      [
        {
          'name'      => 'givenName',
          'surname'   => 'sn',
          'username'  => 'cn',
          'member_of' => 'memberOf',
          'email'     => 'email',
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
          'invalid' => 'invalid',
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
