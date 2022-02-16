Puppet::Type.newtype(:plesk_extension) do
  desc 'Managing plesk extensions'

  ensurable do
    desc 'Ensure the status of the resource'

    newvalue :present do
      unless provider.exsts?
        provider.create
      end
    end

    newvalue :absent do
      if provider.exists?
        provider.destroy
      end
    end

    newvalue :latest do
      if provider.exists? 
        provider.upgrade
      end
    end

    newvalue :enable do
      unless provider.enabled?
        provider.enable
      end
    end

    newvalue :disable do
      if provider.enabled?
        provider.disable
      end
    end

    newvalue :exec do
      if provider.exists?
        provider.exec
      end
    end
  
  end

  newparam(:name, :namevar => true) do
    desc 'Name of the extension'
  end

  newproperty(:exec) do
    desc 'Script to execute'
  end

  newproperty(:url) do
    desc 'URL to download ext/upgrade from'
  end

end
