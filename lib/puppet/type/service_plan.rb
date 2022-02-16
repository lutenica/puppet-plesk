Puppet::Type.newtype(:service_plan) do
  desc 'Managing plesk service plans'

  ensurable do

    desc 'Ensure the action to perform'

    newvalue :present do
      unless provider.exists?
        provider.create
      end
    end

    newvalue :absent do
      if provider.exists?
        provider.delete
      end
    end

    newvalue :update do
      if provider.exists?
        provider.update
      end
    end

  end

  newparam(:name, :namevar => true) do
    desc 'Name of the plan'
  end
  newparam(:max_dom_aliases) do
  end
  newparam(:overuse) do
  end
  newparam(:disk_space) do
  end
  newparam(:disk_space_soft) do
  end
  newparam(:max_traffic) do
  end
  newparam(:max_traffic_soft) do
  end
  newparam(:max_wu) do
  end
  newparam(:max_subftp_users) do
  end
  newparam(:max_db) do
  end
  newparam(:max_webapps) do
  end
  newparam(:max_subdom) do
  end
  newparam(:max_site) do
  end
  newparam(:max_site_builder) do
  end
  newparam(:expiration) do
  end
  newparam(:log_rotate) do
  end
  newparam(:log_bysize) do
  end
  newparam(:log_bytime) do
  end
  newparam(:log_max_num_files) do
  end
  newparam(:log_compress) do
  end
  newparam(:keep_traf_stat) do
  end
  newparam(:wuscripts) do
  end
  newparam(:hosting) do
  end
  newparam(:quota) do
  end
  newparam(:ssl) do
  end
  newparam(:ssl_redirect) do
  end
  newparam(:asp) do
  end
  newparam(:ssi) do
  end
  newparam(:php) do
  end
  newparam(:php_handler_id) do
  end
  newparam(:php_served_by_nginx) do
  end
  newparam(:cgi) do
  end
  newparam(:perl) do
  end
  newparam(:python) do
  end
  newparam(:fastcgi) do
  end
  newparam(:webstat) do
  end
  newparam(:err_docs) do
  end
  newparam(:shell) do
  end
  newparam(:webstat_protdir) do
  end
  newparam(:publish_sb_site) do
  end
  newparam(:upsell_site_builder) do
  end
  newparam(:apache_restrict_follow_sym_links) do
  end
  newparam(:apache_additional_settings) do
  end
  newparam(:apache_additional_ssl_settings) do
  end
  newparam(:nginx_additional_settings) do
  end
  newparam(:create_domains) do
  end
  newparam(:manage_phosting) do
  end
  newparam(:manage_php_settings) do
  end
  newparam(:manage_php_version) do
  end
  newparam(:manage_php_safe_mode) do
  end
  newparam(:manage_sh_access) do
  end
  newparam(:manage_not_chroot_shell) do
  end
  newparam(:manage_quota) do
  end
  newparam(:manage_subdomains) do
  end
  newparam(:manage_domain_aliases) do
  end
  newparam(:manage_log) do
  end
  newparam(:manage_anonftp) do
  end
  newparam(:manage_subftp) do
  end
  newparam(:manage_crontab) do
  end
  newparam(:manage_webapps) do
  end
  newparam(:manage_webstat) do
  end
  newparam(:allow_local_backups) do
  end
  newparam(:allow_ftp_backups) do
  end
  newparam(:allow_account_local_backups) do
  end
  newparam(:allow_account_ftp_backups) do
  end
  newparam(:manage_performance) do
  end
  newparam(:select_db_server) do
  end
  newparam(:remote_db_connection) do
  end
  newparam(:manage_protected_dirs) do
  end
  newparam(:access_service_users) do
  end
  newparam(:access_appcatalog) do
  end
  newparam(:allow_insecure_sites) do
  end
  newparam(:nginx_proxy_mode) do
  end
  newparam(:settings) do
  end
  newparam(:additional_settings) do
  end
  newparam(:unpaid_website_status) do
  end
  newparam(:default_server_mysql) do
  end
  newparam(:default_server_postgresql) do
  end
  newparam(:ext_permission_git_manage_git) do
  end
  newparam(:ext_permission_ruby_support_management) do
  end
  newparam(:ext_permission_ruby_state_management) do
  end
  newparam(:ext_permission_ruby_version_management) do
  end
  newparam(:ext_permission_nodejs_support_management) do
  end
  newparam(:ext_permission_nodejs_state_management) do
  end
  newparam(:ext_permission_nodejs_version_management) do
  end
  newparam(:ext_permission_wp_toolkit_manage_wordpress_toolkit) do
  end
  newparam(:ext_permission_wp_toolkit_manage_security_wordpress_toolkit) do
  end
  newparam(:ext_permission_wp_toolkit_manage_cloning) do
  end
  newparam(:ext_permission_wp_toolkit_manage_syncing) do
  end
  newparam(:ext_permission_wp_toolkit_manage_autoupdates) do
  end

end
