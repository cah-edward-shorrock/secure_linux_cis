# 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
#
# Description:
# The auditing daemon, auditd , stores log data in the /var/log/audit directory.
#
# @summary 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_12
class secure_linux_cis::redhat7::cis_1_1_12 (
  Boolean $enforced = true,
) {
  if $enforced {

    if ! $facts['mountpoints']['/var/log/audit'] {
      notify {'vla':
        message  => 'Not in compliance with CIS 1.1.12 (Scored). /var/log/audit is not in a seperate partition',
        loglevel => 'warning',
      }
    }

  }
}
