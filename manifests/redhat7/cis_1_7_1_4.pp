# 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
#
#
# Description:
# The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
#
# @summary 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param banner Text of the motd, if $motd is empty
# @param motd Text of the motd
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_1_4
class secure_linux_cis::redhat7::cis_1_7_1_4 (
  Boolean           $enforced = true,
  Optional[String]  $banner   = undef,
  Optional[String]  $motd     = undef,
) {

  if $enforced {

    if !$motd and $banner {
      $motd_real = $banner
    }
    else {
      $motd_real = $motd
    }

    file { '/etc/motd':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $motd_real,
    }
  }
}
