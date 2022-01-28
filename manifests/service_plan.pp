# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   plesk::service_plan { 'PlanName': 
#     ensure => update,
#     option => "-disk_space",
#     param  => "1000M"
#   }
#
#
# @param ensure
#   Perform the desired action
#
#   create - creates the plan
#   update - set the given plan options
#   delete - remove the plan
#
#   Due to Plesk's bizarreness you
#   can't see if a plan exists....
#  
# @param option 
#   Options to  for plan updates
#
# @param param
#   Parameter for the option  
#
define plesk::service_plan (
  Enum['create','update','delete'] $ensure = create,
  Optional['String'] $option,
  Optional['String'] $param
) { 
    service_plan { $name:,
      ensure => $ensure,
      option => $option,
      param  => $param
    }
}
