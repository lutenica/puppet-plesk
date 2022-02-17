# @summary Install uninstall Plesk extensions
#
# @example
#   plesk::extensions {'wp-toolkit':
#     ensure => present
#   }
#
# @param ensure
#   Ensure the state. Where present and absent
#   are obvious
#
#   latest will upgrade the extension
#   if installed. If not it will install.
#
#   enabled enables if installed, installs if not.
#  
#
#   disable only disables if the extension is installed
#   and does not uninstall. 
#
# @param exec
#   Script to execute on the extension
#
# @url
#   Url to download extension/upgrade from  
#      
define plesk::extension(
  Enum['present', 'absent', 'latest', 'enabled', 'disabled', 'exec'] $ensure = present,
  Optional[String] $exec = undef,
  Optional[String] $url = undef
) {
    plesk_extension { $name:
      ensure => $ensure,
      exec   => $exec,
      url    => $url
    }
}    
