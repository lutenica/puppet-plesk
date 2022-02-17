# @summary  Setup Plesk theme through apt deb package
#
# @example
#   include plesk::theme 
#     
# @param ensure
#   Ensure state of the theme.
#
# @param apt
#
#   Boolean weather to use a package or directly install from
#   the specified file
#
# @param theme_name
#   Name of the theme package. This should also match the name
#   shown in Plesk itself, i.e in the meta.xml otherwise ensures
#   wont work as expected.
#
# @param theme_path
#   Path of the zip file with the theme's contents
#
class plesk::theme (
  Enum['present', 'absent'] $ensure = present,
  Bool $apt = true,
  String $theme_name,
  String $theme_path
) {
  if $apt {
    package { $theme_name:
      ensure   => $ensure,
      provider => apt,
      notify   => Plesk_branding_theme[$theme_name]
    }
  }
  plesk_branding_theme { $theme_name:
    ensure => $ensure,
    source => $theme_path
  }
}
