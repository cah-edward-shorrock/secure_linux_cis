# 6.2.18 Ensure no duplicate user names exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually
# edit the /etc/passwd file and change the user name.
#
# @summary 6.2.18 Ensure no duplicate user names exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_18
class secure_linux_cis::redhat7::cis_6_2_18 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/cis_scripts/dup_usr.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/dup_usr.sh'),
    }

    if !($facts['duplicate_user'].empty) {

      notify { 'dusr':
        message  => 'Not in compliance with CIS 6.2.18 (Scored). There is a duplicate user name(s) in /etc/passwd. Check the duplicate_user fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
