require File.expand_path(File.join(File.dirname(__FILE__), '..', 'plesk'))
Puppet::Type.type(:service_plan).provide(:plan, parent: Puppet::Provider::Plesk) do
  desc 'Plesk service plan management'

  SYSPARAMS = ['name', 'ensure', 'provider', 'loglevel'].freeze

  FIXDASH = ['log_rotate', 'log_bysize', 'log_bytime', 'log_max_num_files', 'log_compress', 'ssl_redirect', 'publish_sb_site', 'apache_restrict_follow_sym_links', 'apache_additional_settings',
              'apache_additional_ssl_settings', 'nginx_additional_settings', 'nginx_proxy_mode', 'additional_settings', 'unpaid_website_status'].freeze

  commands plesk: '/usr/sbin/plesk'

  def exists?
    name = @resource[:name]
    state = self.class.psql_caller("select name from Templates where name = '#{name}'")
    if state.to_s.tr("\n", '') == name
      true
    else
      false
    end
  end

  def create
    c_array = []
    params = @resource.parameters_with_value
    params.each do |p|
      ps = p.to_s
      next if SYSPARAMS.include? ps
      val = @resource[ps]
      if FIXDASH.include? ps
        ps.tr!('_', '-')
      end
      opt = '-' + ps
      c_array.append(opt, val)
    end
    plesk 'bin', 'service_plan', '-c', resource[:name], c_array.flatten
  end

  def delete
    plesk 'bin', 'service_plan', '-r', resource[:name]
  end

  def update
    c_array = []
    params = @resource.parameters_with_value
    params.each do |p|
      ps = p.to_s
      next if SYSPARAMS.include? ps
      val = @resource[ps]
      if FIXDASH.include? ps
        ps.tr!('_', '-')
      end
      opt = '-' + ps
      c_array.append(opt, val)
    end
    plesk 'bin', 'service_plan', '-u', resource[:name], c_array.flatten
  end

end
