# frozen_string_literal: true

# plus_group.rb
# Contains "+" entries in /etc/group

Facter.add('plus_group') do
  confine osfamily: ['RedHat', 'Debian']
  setcode "grep '^\\+:' /etc/group"
end
