Puppet::Type.newtype(:service_plan) do
  desc 'Managing plesk service plans'

  ensurable do

    desc 'Ensure the action to perform'

    newvalue :create do
      provider.create
    end

    newvalue :delete do
      provider.delete
    end

    newvalue :update do
      provider.update
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
