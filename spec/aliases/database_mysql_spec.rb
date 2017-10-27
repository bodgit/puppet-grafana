require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::database::mysql', type: :class do
    describe 'accepts a MySQL database' do
      [
        {
          'type' => 'mysql',
        },
        {
          'type' => 'mysql',
          'host' => '/var/run/mysqld/mysqld.sock',
        },
        {
          'type'             => 'mysql',
          'host'             => ['127.0.0.1', 3306],
          'user'             => 'root',
          'password'         => 'password',
          'ssl_mode'         => 'skip-verify',
          'ca_cert_path'     => '/path/to/ca.pem',
          'client_key_path'  => '/path/to/client.key',
          'client_cert_path' => '/path/to/client.pem',
          'server_cert_name' => 'mysql',
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
          'type'    => 'mysql',
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
