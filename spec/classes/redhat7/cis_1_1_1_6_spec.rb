require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_1_1_6' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_kmod__install('squashfs')
              .with(
                command: '/bin/true',
              )
          }
        else
          it {
            is_expected.not_to contain_kmod__install('squashfs')
          }
        end
      end
    end
  end
end
