require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.4.0') >= 0
  describe 'test::database::sqlite', type: :class do
    describe 'accepts an SQLite database' do
      [
        {
          'type' => 'sqlite3',
        },
        {
          'type' => 'sqlite3',
          'path' => 'grafana.db',
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
          'type'    => 'sqlite3',
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
