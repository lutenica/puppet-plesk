Puppet::Type.type(:plesk_branding_theme).provide(:theme) do
  desc "Plesk theme management"

  commands :plesk => "/usr/sbin/plesk"

  def create
    plesk "bin", "branding_theme", "-i", "-vendor", "admin", "-source", resource[:source]
  end

  def destroy
    plesk "bin", "branding_theme", "-u", resource[:name]
  end

  def exists?
    _name = resource[:name]
    File.directory?("/opt/psa/admin/htdocs/theme-skins/#{_name}")
  end

end
