class Puppet::Provider::Plesk < Puppet::Provider
  initvars

  commands plesk: '/usr/sbin/plesk'

  def self.psql_caller(sql_commands)
    plesk(['db', '-NBe', sql_commands].flatten.compact).scrub
  end
end
