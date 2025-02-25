# frozen_string_literal: true

# dot_file_writable.rb
# Contains dot files that are either group or world writable

Facter.add('dot_file_writable') do
  confine osfamily: ['RedHat', 'Debian']
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/dot_file_wr.sh')
  end
end
