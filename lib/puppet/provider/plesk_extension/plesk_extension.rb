Puppet::Type.type(:plesk_extension).provide(:extension) do
  desc "Plesk extension management"

  commands :plesk => "/usr/sbin/plesk"

  def exists?
    _name = resource[:name]
    File.directory?("/opt/psa/admin/htdocs/modules/#{_name}")
  end

  def create

    iurl = resource[:url]

    if iurl.nil?
      plesk "bin", "extension", "-i", resource[:name]
    else
      plesk "bin", "extension", "--install-url", iurl
    end

  end

  def destroy
    plesk "bin", "extension", "-u", resource[:name]
  end

  def upgrade

    uurl = resource[:url]

    if uurl.nil?
      plesk "bin", "extension", "-g", resource[:name]
    else
      plesk "bin", "extension", "--upgrade-url", uurl
    end

  end
  
  def exec
    plesk "bin", "extension", "-e", resource[:exec]
  end
  
  def enable
    plesk "bin", "extension", "--enable", resource[:name]
  end

  def disable
    plesk "bin", "extension", "--disable", resource[:name]
  end

end
