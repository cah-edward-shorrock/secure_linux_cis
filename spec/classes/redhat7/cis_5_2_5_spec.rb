require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'max_auth_tries' => 4 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh max auth tries')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'MaxAuthTries 4',
                match:  '^#?MaxAuthTries',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh max auth tries')
          }
        end
      end
    end
  end
end
