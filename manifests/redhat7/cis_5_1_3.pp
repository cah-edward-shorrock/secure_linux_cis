# 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
#
# Description:
# This directory contains system cron jobs that need to run on an hourly basis.
# The files in this directory cannot be manipulated by the crontab command, but
# are instead edited by system administrators using a text editor. The commands
# below restrict read/write and search access to user and group root, preventing
# regular users from accessing this directory.
#
# Rationale:
# Granting write access to this directory for non-privileged users could provide
# them the means for gaining unauthorized elevated privileges. Granting read
# access to this directory could give an unprivileged user insight in how to gain
# elevated privileges or circumvent auditing controls.
#
# @summary 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_5_1_3
class secure_linux_cis::redhat7::cis_5_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/cron.hourly':
      ensure => directory,
      group  => 'root',
      owner  => 'root',
      mode   => '0700',
    }
  }
}
