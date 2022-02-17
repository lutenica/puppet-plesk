# @summary Manage Plesk notifications 
#   
#   Manages Plesk notifications and their settings
#  
# @example
#   plesk::notification { 'domain_creation': 
#     ensure        => present,
#     send2admin    => 'false',
#     send2reseller => 'false',
#     send2client   => 'true',     
#   }
#
# Example 2:
#   plesk::notification { 'client_creation':
#     ensure        => present,
#     send2admin    => 'false',
#     send2reseller => 'false',
#     send2client   => 'true',
#     subj          => 'You super awesome account',
#     txt           => 'Has been created'
#   }
#
# Make sure that the name of your resource matches the supported notification codes
# listed here: 
#
# https://docs.plesk.com/en-US/obsidian/cli-linux/using-command-line-utilities/notification-email-notification-about-system-events.66604/
#
# @param ensure
#   
#   Ensure the status of the resource
#
# @param send2admin
#  
#   Enables sending of notices about the specified event to the server administrator
#
# @param send2reseller
#
#   Enables sending of notices about the specified event to the appropriate reseller accounts
#
# @param send2client
#   
#   Enables sending of notices about the specified event to the appropriate customer accounts.
#
# @param send2email
#
#   Enables sending of notices about the specified event to the appropriate customer accounts
#
# @param email
#   
#   Optional address for send2mail
#
# @param subj
#   
#   Optional subject for the given notification code
#
# @param text
#
#   Optional text for the notification
#
define plesk::notification (
  Enum['present','absent'] $ensure = 'present',
  Enum['true','false'] $send2admin = undef,
  Enum['true','false'] $send2reseller = undef,
  Enum['true','false'] $send2client = undef,
  Optional[Enum['true','false']] $send2email = undef,
  Optional[String] $email = undef,
  Optional[String] $subj = undef,
  Optional[String] $text = undef
) {
    plesk_notification { $name:
      ensure        => $ensure,
      send2admin    => $send2admin,
      send2reseller => $send2reseller,
      send2client   => $send2client,
      send2email    => $send2email,
      email         => $email,
      subj          => $subj,
      text          => $text
    }
}
