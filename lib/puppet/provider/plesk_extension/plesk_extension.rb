require File.expand_path(File.join(File.dirname(__FILE__), '..', 'plesk'))
Puppet::Type.type(:plesk_extension).provide(:extension, parent: Puppet::Provider::Plesk) do
  desc 'Plesk extension management'

  commands plesk: '/usr/sbin/plesk'

  def exists?
    name = @resource[:name]
    state = self.class.psql_caller("select name from Modules where name = '#{name}'")
    if state.to_s.tr("\n", '') == name
      true
    else
      false
    end
  end

  def enabled?
    name = @resource[:name]
    state = self.class.psql_caller("select status from Modules where name = '#{name}'")
    if state.to_s.tr("\n", '') == 'true'
      true
    else
      false
    end
  end

  def create
    name = @resource[:name]
    iurl = resource[:url]
    if iurl.nil?
      plesk 'bin', 'extension', '-i', name
    else
      plesk 'bin', 'extension', '--install-url', iurl
    end
  end

  def destroy
    plesk 'bin', 'extension', '-u', @resource[:name]
  end

  def upgrade
    uurl = resource[:url]
    if uurl.nil?
      plesk 'bin', 'extension', '-g', @resource[:name]
    else
      plesk 'bin', 'extension', '--upgrade-url', uurl
    end
  end

  def exec
    plesk 'bin', 'extension', '-e', resource[:exec]
  end

  def enable
    plesk 'bin', 'extension', '--enable', @resource[:name]
  end

  def disable
    plesk 'bin', 'extension', '--disable', @resource[:name]
  end
end
