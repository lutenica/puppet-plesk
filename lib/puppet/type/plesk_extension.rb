Puppet::Type.newtype(:plesk_extension) do
  desc 'Managing plesk extensions'

  ensurable do
    desc 'Ensure the status of the resource'

    newvalue :present do
      if !provider.exists?
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
      else
        provider.create
      end
    end

    newvalue :enable do
      if provider.exists?
        provider.enable
      else
        provider.create
      end
    end

    newvalue :disable do
      if provider.exists?
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
