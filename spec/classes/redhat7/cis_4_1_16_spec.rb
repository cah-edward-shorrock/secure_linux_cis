require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_16' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules sudo.log 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/rules.d/audit.rules',
                line: '-w /var/log/sudo.log -p wa -k actions',
              )
          }
        else
          it { is_expected.not_to contain_file_line('audit.rules sudo.log 1') }
        end
      end
    end
  end
end
