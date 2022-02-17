Puppet::Type.newtype(:plesk_notification) do
  desc 'Managing plesk notification'

  ensurable

  newparam(:name, namevar: true) do
    desc 'Name of the notification code'
  end

  newparam(:send2admin) do
    desc 'Sending notice to the server administrator.'
  end

  newparam(:send2reseller) do
    desc 'Sending notice to the reseller account'
  end

  newparam(:send2client) do
    desc 'Sending notice to the client account'
  end

  newparam(:send2email) do
    desc 'Optional email to send to'
  end

  newparam(:email) do
    desc 'Optional target email for send2email'
  end

  newparam(:subj) do
    desc 'Optional subject for the notification'
  end

  newparam(:text) do
    desc 'Optional text content'
  end
end
