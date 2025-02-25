require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_7_1_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge('issue_net' => '')
        end
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_notify('issuen')
          }
        else
          it { is_expected.not_to contain_notify('issuen') }
        end
      end
    end
  end
end
