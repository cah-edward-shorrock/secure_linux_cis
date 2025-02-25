# frozen_string_literal: true

# plus_shadow.rb
# Contains "+" entries in /etc/shadow

Facter.add('plus_shadow') do
  confine osfamily: ['RedHat', 'Debian']
  setcode "grep '^\\+:' /etc/shadow"
end
