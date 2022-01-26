# @summary Install uninstall Plesk extensions
#
# @example
#   plesk::extensions {'wp-toolkit':
#     ensure => present
#   }
#
# @param ensure
#   Ensure the state.
#
# @param exec
#   Script to execute on the extension
#
# @url
#   Url to download extension/upgrade from
#      
define plesk::extensions(
  Enum['present', 'absent', 'latest', 'enabled', 'disabled', 'exec'] $ensure = present,
  Optional['String'] $exec,
  Optional['String'] $url
) {
    plesk_extension { $name:
      ensure => $ensure,
      exec   => $exec,
      url    => $url
    }
}    
