# @summary A short summary of the purpose of this defined type.
#
# Create service plan with desired specifications
#
# @example
#   plesk::service_plan { 'PlanName': 
#     ensure              => present,
#     disk_space          => "100M",
#     php_served_by_nginx => "true",
#     overuse             => "block"
#   }
#
# All params have their details below:
#  https://docs.plesk.com/en-US/obsidian/cli-linux/using-command-line-utilities/service_plan-hosting-plans.38365/
# Note that those with dashes, have been changed to the same but with underscores.
#
define plesk::service_plan (
  Enum['present','absent','update'] $ensure = present,
  Optional[String] $max_dom_aliases = undef,
  Optional[Enum['block','not_suspend','notify','normal']] $overuse = block,
  Optional[String] $disk_space = undef,
  Optional[String] $disk_space_soft = undef,
  Optional[String] $max_traffic = undef,
  Optional[String] $max_traffic_soft = undef,
  Optional[String] $max_wu = undef,
  Optional[String] $max_subftp_users = undef,
  Optional[String] $max_db = undef,
  Optional[String] $max_webapps = undef,
  Optional[String] $max_subdom = undef,
  Optional[String] $max_site = undef,
  Optional[String] $max_site_builder = undef,
  Optional[String] $expiration = undef,
  Optional[Enum['true','false']] $log_rotate = 'true',
  Optional[String] $log_bysize = undef,
  Optional[Enum['daily','weekly','monthly']] $log_bytime = 'daily',
  Optional[String] $log_max_num_files = undef,
  Optional[Enum['true','false']] $log_compress = 'true',
  Optional[String] $keep_traf_stat = undef,
  Optional[Enum['true','false']] $wuscripts = 'false',
  Optional[Enum['true','false']] $hosting = 'true',
  Optional[String] $quota = undef,
  Optional[Enum['true','false']] $ssl = 'true',
  Optional[Enum['true','false']] $ssl_redirect = 'true',
  Optional[Enum['true','false']] $asp = 'false',
  Optional[Enum['true','false']] $ssi = 'false',
  Optional[Enum['true','false']] $php = 'true',
  Optional[String] $php_handler_id = 'plesk-php80-fpm',
  Optional[Enum['true','false']] $php_served_by_nginx = 'true',
  Optional[Enum['true','false']] $cgi = 'false',
  Optional[Enum['true','false']] $perl = 'false',
  Optional[Enum['true','false']] $python = 'false',
  Optional[Enum['true','false']] $fastcgi = 'false',
  Optional[Enum['none','webalizer','awstats']] $webstat = 'none',
  Optional[Enum['true','false']] $err_docs = 'true',
  Optional[String] $shell = 'false',
  Optional[Enum['true','false']] $webstat_protdir = 'false',
  Optional[Enum['true','false']] $publish_sb_site = 'false',
  Optional[Enum['true','false']] $upsell_site_builder = 'false',
  Optional[Enum['true','false']] $apache_restrict_follow_sym_links = 'false',
  Optional[String] $apache_additional_settings = undef,
  Optional[String] $apache_additional_ssl_settings = undef,
  Optional[String] $nginx_additional_settings = undef,
  Optional[Enum['true','false']] $create_domains = 'true',
  Optional[Enum['true','false']] $manage_phosting = 'false',
  Optional[Enum['true','false']] $manage_php_settings = 'true',
  Optional[Enum['true','false']] $manage_php_version = 'true',
  Optional[Enum['true','false']] $manage_php_safe_mode = 'true',
  Optional[Enum['true','false']] $manage_sh_access = 'false',
  Optional[Enum['true','false']] $manage_not_chroot_shell = 'false',
  Optional[Enum['true','false']] $manage_quota = 'false',
  Optional[Enum['true','false']] $manage_subdomains = 'true',
  Optional[Enum['true','false']] $manage_domain_aliases = 'true',
  Optional[Enum['true','false']] $manage_log = 'true',
  Optional[Enum['true','false']] $manage_anonftp = 'false',
  Optional[Enum['true','false']] $manage_subftp = 'true',
  Optional[Enum['true','false']] $manage_crontab = 'false',
  Optional[Enum['true','false']] $manage_webapps = undef,
  Optional[Enum['true','false']] $manage_webstat = 'false',
  Optional[Enum['true','false']] $allow_local_backups = 'true',
  Optional[Enum['true','false']] $allow_ftp_backups = 'false',
  Optional[Enum['true','false']] $allow_account_local_backups = 'true',
  Optional[Enum['true','false']] $allow_account_ftp_backups = 'false',
  Optional[Enum['true','false']] $manage_performance = 'false',
  Optional[Enum['true','false']] $select_db_server = 'false',
  Optional[Enum['true','false']] $remote_db_connection = 'false',
  Optional[Enum['true','false']] $manage_protected_dirs = 'true',
  Optional[Enum['true','false']] $access_service_users = 'false',
  Optional[Enum['true','false']] $access_appcatalog = 'false',
  Optional[Enum['true','false']] $allow_insecure_sites = 'true',
  Optional[Enum['true','false']] $nginx_proxy_mode = 'true',
  Optional[String] $settings = undef,
  Optional[String] $additional_settings = undef,
  Optional[Enum['disabled','suspended','active']] $unpaid_website_status = 'disabled',
  Optional[String] $default_server_mysql = undef,
  Optional[String] $default_server_postgresql = undef,
  Optional[Enum['true','false']] $ext_permission_git_manage_git = 'false',
  Optional[Enum['true','false']] $ext_permission_ruby_support_management = undef,
  Optional[Enum['true','false']] $ext_permission_ruby_state_management = undef,
  Optional[Enum['true','false']] $ext_permission_ruby_version_management = undef,
  Optional[Enum['true','false']] $ext_permission_nodejs_support_management = undef,
  Optional[Enum['true','false']] $ext_permission_nodejs_state_management = undef,
  Optional[Enum['true','false']] $ext_permission_nodejs_version_management = undef,
  Optional[Enum['true','false']] $ext_permission_wp_toolkit_manage_wordpress_toolkit = 'true',
  Optional[Enum['true','false']] $ext_permission_wp_toolkit_manage_security_wordpress_toolkit = 'true',
  Optional[Enum['true','false']] $ext_permission_wp_toolkit_manage_cloning = 'true',
  Optional[Enum['true','false']] $ext_permission_wp_toolkit_manage_syncing = 'true',
  Optional[Enum['true','false']] $ext_permission_wp_toolkit_manage_autoupdates = 'true'
) {
    service_plan { "$name":
      ensure                                                      => $ensure,
      max_dom_aliases                                             => $max_dom_aliases,
      overuse                                                     => $overuse,
      disk_space                                                  => $disk_space,
      disk_space_soft                                             => $disk_space_soft,
      max_traffic                                                 => $max_traffic,
      max_traffic_soft                                            => $max_traffic_soft,
      max_wu                                                      => $max_wu,
      max_subftp_users                                            => $max_subftp_users,
      max_db                                                      => $max_db,
      max_webapps                                                 => $max_webapps,
      max_subdom                                                  => $max_subdom,
      max_site                                                    => $max_site,
      max_site_builder                                            => $max_site_builder,
      expiration                                                  => $expiration,
      log_rotate                                                  => $log_rotate,
      log_bysize                                                  => $log_bysize,
      log_bytime                                                  => $log_bytime,
      log_max_num_files                                           => $log_max_num_files,
      log_compress                                                => $log_compress,
      keep_traf_stat                                              => $keep_traf_stat,
      wuscripts                                                   => $wuscripts,
      hosting                                                     => $hosting,
      quota                                                       => $quota,
      ssl                                                         => $ssl,
      ssl_redirect                                                => $ssl_redirect,
      asp                                                         => $asp,
      ssi                                                         => $ssi,
      php                                                         => $php,
      php_handler_id                                              => $php_handler_id,
      php_served_by_nginx                                         => $php_served_by_nginx,
      cgi                                                         => $cgi,
      perl                                                        => $perl,
      python                                                      => $python,
      fastcgi                                                     => $fastcgi,
      webstat                                                     => $webstat,
      err_docs                                                    => $err_docs,
      shell                                                       => $shell,
      webstat_protdir                                             => $webstat_protdir,
      publish_sb_site                                             => $publish_sb_site,
      upsell_site_builder                                         => $upsell_site_builder,
      apache_restrict_follow_sym_links                            => $apache_restrict_follow_sym_links,
      apache_additional_settings                                  => $apache_additional_settings,
      apache_additional_ssl_settings                              => $apache_additional_ssl_settings,
      nginx_additional_settings                                   => $nginx_additional_settings,
      create_domains                                              => $create_domains,
      manage_phosting                                             => $manage_phosting,
      manage_php_settings                                         => $manage_php_settings,
      manage_php_version                                          => $manage_php_version,
      manage_php_safe_mode                                        => $manage_php_safe_mode,
      manage_sh_access                                            => $manage_sh_access,
      manage_not_chroot_shell                                     => $manage_not_chroot_shell,
      manage_quota                                                => $manage_quota,
      manage_subdomains                                           => $manage_subdomains,
      manage_domain_aliases                                       => $manage_domain_aliases,
      manage_log                                                  => $manage_log,
      manage_anonftp                                              => $manage_anonftp,
      manage_subftp                                               => $manage_subftp,
      manage_crontab                                              => $manage_crontab,
      manage_webapps                                              => $manage_webapps,
      manage_webstat                                              => $manage_webstat,
      allow_local_backups                                         => $allow_local_backups,
      allow_ftp_backups                                           => $allow_ftp_backups,
      allow_account_local_backups                                 => $allow_account_local_backups,
      allow_account_ftp_backups                                   => $allow_account_ftp_backups,
      manage_performance                                          => $manage_performance,
      select_db_server                                            => $select_db_server,
      remote_db_connection                                        => $remote_db_connection,
      manage_protected_dirs                                       => $manage_protected_dirs,
      access_service_users                                        => $access_service_users,
      access_appcatalog                                           => $access_appcatalog,
      allow_insecure_sites                                        => $allow_insecure_sites,
      nginx_proxy_mode                                            => $nginx_proxy_mode,
      settings                                                    => $settings,
      additional_settings                                         => $additional_settings,
      unpaid_website_status                                       => $unpaid_website_status,
      default_server_mysql                                        => $default_server_mysql,
      default_server_postgresql                                   => $default_server_postgresql,
      ext_permission_git_manage_git                               => $ext_permission_git_manage_git,
      ext_permission_ruby_support_management                      => $ext_permission_ruby_support_management,
      ext_permission_ruby_state_management                        => $ext_permission_ruby_state_management,
      ext_permission_ruby_version_management                      => $ext_permission_ruby_version_management,
      ext_permission_nodejs_support_management                    => $ext_permission_nodejs_support_management,
      ext_permission_nodejs_state_management                      => $ext_permission_nodejs_state_management,
      ext_permission_nodejs_version_management                    => $ext_permission_nodejs_version_management,
      ext_permission_wp_toolkit_manage_wordpress_toolkit          => $ext_permission_wp_toolkit_manage_wordp,
      ext_permission_wp_toolkit_manage_security_wordpress_toolkit => $ext_permission_wp_toolkit_man,
      ext_permission_wp_toolkit_manage_cloning                    => $ext_permission_wp_toolkit_manage_cloning,
      ext_permission_wp_toolkit_manage_syncing                    => $ext_permission_wp_toolkit_manage_syncing,
      ext_permission_wp_toolkit_manage_autoupdates                => $ext_permission_wp_toolkit_manage_autoupdates
    }
}
