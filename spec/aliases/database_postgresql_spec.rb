require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::database::postgresql', type: :class do
    describe 'accepts a PostgreSQL database' do
      [
        {
          'type' => 'postgres',
          'host' => '127.0.0.1',
        },
        {
          'type'     => 'postgres',
          'host'     => ['127.0.0.1', 5432],
          'name'     => 'grafana',
          'user'     => 'root',
          'password' => 'password',
          'ssl_mode' => 'verify-full',
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
          'type'    => 'postgres',
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
