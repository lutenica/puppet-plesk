Puppet::Type.newtype(:plesk_branding_theme) do
  desc 'Managing plesk branding themes'

  ensurable

  newparam(:name, namevar: true) do
    desc 'Name of the theme'
  end

  newproperty(:source) do
    desc 'Path to the theme archive'
  end
end
