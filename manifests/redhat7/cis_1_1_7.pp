# 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
#
#
# Description:
# The /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_7
class secure_linux_cis::redhat7::cis_1_1_7 (
  Boolean $enforced = true,
) {
  if $enforced {

    if ! $facts['mountpoints']['/var/tmp'] {
      notify { 'vtp':
        message  => 'Not in compliance with CIS 1.1.7 (Scored). There is not a separate partition for /var/tmp',
        loglevel => 'warning',
      }
    }

  }
}
