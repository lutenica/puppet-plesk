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
  newproperty(:max_dom_aliases) do
  end
  newproperty(:overuse) do
  end
  newproperty(:disk_space) do
  end
  newproperty(:disk_space_soft) do
  end
  newproperty(:max_traffic) do
  end
  newproperty(:max_traffic_soft) do
  end
  newproperty(:max_wu) do
  end
  newproperty(:max_subftp_users) do
  end
  newproperty(:max_db) do
  end
  newproperty(:max_webapps) do
  end
  newproperty(:max_subdom) do
  end
  newproperty(:max_site) do
  end
  newproperty(:max_site_builder) do
  end
  newproperty(:expiration) do
  end
  newproperty(:log-rotate) do
  end
  newproperty(:log-bysize) do
  end
  newproperty(:log-bytime) do
  end
  newproperty(:log-max-num-files) do
  end
  newproperty(:log-compress) do
  end
  newproperty(:keep_traf_stat) do
  end
  newproperty(:wuscripts) do
  end
  newproperty(:hosting) do
  end
  newproperty(:quota) do
  end
  newproperty(:ssl) do
  end
  newproperty(:ssl-redirect) do
  end
  newproperty(:asp) do
  end
  newproperty(:ssi) do
  end
  newproperty(:php) do
  end
  newproperty(:php_handler_id) do
  end
  newproperty(:php_served_by_nginx) do
  end
  newproperty(:cgi) do
  end
  newproperty(:perl) do
  end
  newproperty(:python) do
  end
  newproperty(:fastcgi) do
  end
  newproperty(:webstat) do
  end
  newproperty(:err_docs) do
  end
  newproperty(:shell) do
  end
  newproperty(:webstat_protdir) do
  end
  newproperty(:publish-sb-site) do
  end
  newproperty(:upsell_site_builder) do
  end
  newproperty(:apache-restrict-follow-sym-links) do
  end
  newproperty(:apache-additional-settings) do
  end
  newproperty(:apache-additional-ssl-settings) do
  end
  newproperty(:nginx-additional-settings) do
  end
  newproperty(:create_domains) do
  end
  newproperty(:manage_phosting) do
  end
  newproperty(:manage_php_settings) do
  end
  newproperty(:manage_php_version) do
  end
  newproperty(:manage_php_safe_mode) do
  end
  newproperty(:manage_sh_access) do
  end
  newproperty(:manage_not_chroot_shell) do
  end
  newproperty(:manage_quota) do
  end
  newproperty(:manage_subdomains) do
  end
  newproperty(:manage_domain_aliases) do
  end
  newproperty(:manage_log) do
  end
  newproperty(:manage_anonftp) do
  end
  newproperty(:manage_subftp) do
  end
  newproperty(:manage_crontab) do
  end
  newproperty(:manage_webapps) do
  end
  newproperty(:manage_webstat) do
  end
  newproperty(:allow_local_backups) do
  end
  newproperty(:allow_ftp_backups) do
  end
  newproperty(:allow_account_local_backups) do
  end
  newproperty(:allow_account_ftp_backups) do
  end
  newproperty(:manage_performance) do
  end
  newproperty(:select_db_server) do
  end
  newproperty(:remote_db_connection) do
  end
  newproperty(:manage_protected_dirs) do
  end
  newproperty(:access_service_users) do
  end
  newproperty(:access_appcatalog) do
  end
  newproperty(:allow_insecure_sites) do
  end
  newproperty(:nginx-proxy-mode) do
  end
  newproperty(:settings) do
  end
  newproperty(:additional-settings) do
  end
  newproperty(:unpaid-website-status) do
  end
  newproperty(:default_server_mysql) do
  end
  newproperty(:default_server_postgresql) do
  end
  newproperty(:ext_permission_git_manage_git) do
  end
  newproperty(:ext_permission_ruby_support_management) do
  end
  newproperty(:ext_permission_ruby_state_management) do
  end
  newproperty(:ext_permission_ruby_version_management) do
  end
  newproperty(:ext_permission_nodejs_support_management) do
  end
  newproperty(:ext_permission_nodejs_state_management) do
  end
  newproperty(:ext_permission_nodejs_version_management) do
  end
  newproperty(:ext_permission_wp_toolkit_manage_wordpress_toolkit) do
  end
  newproperty(:ext_permission_wp_toolkit_manage_security_wordpress_toolkit) do
  end
  newproperty(:ext_permission_wp_toolkit_manage_cloning) do
  end
  newproperty(:ext_permission_wp_toolkit_manage_syncing) do
  end
  newproperty(:ext_permission_wp_toolkit_manage_autoupdates) do
  end

end
