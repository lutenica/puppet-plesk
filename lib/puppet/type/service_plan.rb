Puppet::Type.newtype(:service_plan) do
  desc 'Managing plesk service plans'

  ensurable do

    desc 'Ensure the action to perform'

    newvalue :present do
      unless provider.exists
        provider.create
      end
    end

    newvalue :absent do
      if provider.exists
        provider.delete
      end
    end

    newvalue :update do
      if provider.exists
        provider.update
      end
    end

  end

  newparam(:name, :namevar => true) do
    desc 'Name of the plan'
  end

  newparam(:option) do
    desc 'Option for update'
  end

  newparam(:param) do
    desc 'Parameter for the option'
  end

end
