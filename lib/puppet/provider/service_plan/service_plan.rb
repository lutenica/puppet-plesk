require File.expand_path(File.join(File.dirname(__FILE__), '..', 'plesk')) 
Puppet::Type.type(:service_plan).provide(:plan, parent: Puppet::Provider::Plesk) do
  desc 'Plesk service plan management'

  commands :plesk => "/usr/sbin/plesk"
 puts @resource.parameters_with_value
 def exists?
 
   name = @resource[:name]

   _state = self.class.psql_caller("select name from Templates where name = '#{name}'")
   state = _state.to_s

   if state.tr("\n", '') == name

     return true

   else

     return false

   end
  end

  def create
    plesk "bin", "service_plan", "-c", resource[:name]
  end

  def delete
    plesk "bin", "service_plan", "-r", resource[:name]
  end

  def update

    _option = resource[:option]
    _param = resource[:param]

    if _option.nil?
      # Need to figure out puppet fail statement 
      # so we can abort the run using puts for now
      puts "No option specified for update"
 
    elseif _param.nil?
      # Same as above
      puts "No parameter passed to the option"

    else
      plesk "bin", "service_plan", "-u", _option, _param
    end
  end

end
