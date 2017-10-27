require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::database', type: :class do
    describe 'accepts any database' do
      [
        {
          'type' => 'sqlite3',
        },
        {
          'type' => 'mysql',
        },
        {
          'type' => 'postgres',
          'host' => '127.0.0.1',
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
          'type' => 'invalid',
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
