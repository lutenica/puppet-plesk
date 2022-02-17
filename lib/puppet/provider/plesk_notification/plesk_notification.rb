require File.expand_path(File.join(File.dirname(__FILE__), '..', 'plesk'))
Puppet::Type.type(:plesk_notification).provide(:notification, parent: Puppet::Provider::Plesk) do
  desc 'Plesk notification management'

  commands plesk: '/usr/sbin/plesk'
  CMD = ['bin', 'notification', '--update', '-code'].freeze
  DEL = ['-send2admin', 'false', '-send2reseller', 'false', '-send2client', 'false', '-send2email', 'false', '-subj-set-default', '-text-set-default'].freeze
  SYSPARAMS = ['name', 'ensure', 'provider', 'loglevel'].freeze

  def exists?
    # I'm sure there is a better way to do this...
    name = @resource[:name]
    s2a = if @resource[:send2admin] == 'true'
            '1'
          else
            '0'
          end

    s2r = if @resource[:send2reseller] == 'true'
            '1'
          else
            '0'
          end

    s2c = if @resource[:send2client] == 'true'
            '1'
          else
            '0'
          end

    s2e = if @resource[:send2email] == 'true'
            '1'
          else
            '0'
          end

    id = self.class.psql_caller("select id from Notifications where code = '#{name}' and send2admin = '#{s2a}' and send2reseller = '#{s2r}' and send2client = '#{s2c}' and send2email = '#{s2e}'")
    rsubj = self.class.psql_caller("select subj from Notifications where id = '#{id}'")
    remail = self.class.psql_caller("select email from Notifications where id = '#{id}'")

    if id.to_s.tr("\n", '').empty?
      false
    elsif rsubj.to_s.tr("\n", '') == @resource[:subj]
      if remail.to_s.tr("\n", '') == @resource[:email]
        true
      else
        false
      end
    else
      true
    end
  end

  def create
    c_array = []
    params = @resource.parameters_with_value
    params.each do |p|
      ps = p.to_s
      next if SYSPARAMS.include? ps
      val = @resource[ps]
      opt = '-' + ps
      c_array.append(opt, val)
    end
    plesk CMD.flatten, @resource[:name], c_array.flatten
  end

  def destroy
    plesk CMD.flatten, @resource[:name], DEL.flatten
  end
end
