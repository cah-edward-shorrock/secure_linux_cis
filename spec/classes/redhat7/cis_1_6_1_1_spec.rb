require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_6_1_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_kernel_parameter('quiet').with(ensure: 'present')
            is_expected.to contain_kernel_parameter('selinux=0').with(ensure: 'absent')
            is_expected.to contain_kernel_parameter('enforcing=0').with(ensure: 'absent')
          }
        else
          it {
            is_expected.not_to contain_kernel_parameter('quiet').with(ensure: 'present')
            is_expected.not_to contain_kernel_parameter('selinux=0').with(ensure: 'absent')
            is_expected.not_to contain_kernel_parameter('enforcing=0').with(ensure: 'absent')
          }
        end
      end
    end
  end
end
