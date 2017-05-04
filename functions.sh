#!/bin/bash

zone_name=""

dump_zone () 
{
  echo ${jv_zones["$1"]} 
}

dump_couleur () 
{
  echo "mlmlml $1"
  echo ${jv_couleurs["$1"]} 
}

# $1: yee command to exec
# $2: bulb ip
# $3: color_name/brightness (string/number, optional)
jv_pg_exec_yl_command()
{
  # Send request to yeelight module
  #say $dir #path to jarvis_yeelight
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"       
  python $dir/yeecli/cli.py --ip=$2 $1 $3 2> /dev/null                     
  return $?  
}

# $1: command
# $2: zone_name
# $3: color_name/brightness (string/number, optional)
# return (int): 0 if success, 1 if failed
jv_pg_yl_command ()
{   
  local cmd="$1"
  local zone="$2"
  local color_or_brightness="$3"

  ret=0
  if [ "$3" != "" ]
  then
    color_or_brightness=dump_zone "$color_or_brightness"
  fi

  for ip in `dump_zone $zone`
  do
    jv_pg_exec_yl_command "$cmd" "$ip" "$color_or_brightness"
    if [[ "$?" -gt "0" ]]
    then
      ret=1
      break
    fi
  done 

  if [[ "$ret" -eq "0" ]]
  then
      say "$(jv_pg_yl_lang "$cmd" "success" "$zone")"
  else
      say "$(jv_pg_yl_lang "$cmd" "failed" "$zone")"
      break
  fi    
  return 1
}

# $1: zone name
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
# jv_pg_yl_turnOnAndWhite ()
# {
#   # Send request to yeelight module
#   local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#   #say $dir #path to jarvis_yeelight
#   local result=`python $dir/yeecli/cli.py --ip=$var_jv_pg_yl_ip2 turn on`
  
#   # Show the result to user (if requested)
#   if [[ $result == "Turn on" ]]; then
#     if [[ ! $2 =~ "True" ]]; then
#       say "$(jv_pg_yl_lang turn_on_success $1)"
#     fi
#     return 0
#   else
#     if [[ ! $2 =~ "True" ]]; then
#       say "$(jv_pg_yl_lang turn_on_failed $1)"
#     fi
#   fi

#   return 1
# }

# $1: zone name
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
# jv_pg_yl_turnOff ()
# { 
  
#   #say $var_jv_pg_yl_ip2
#   # Send request to yeelight module
#   local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#   #say $dir #path to jarvis_yeelight
#   for ips in `dump_zone $1`
#   do
#     local result=`python $dir/yeecli/cli.py --ip=$ips turn off 2> /dev/null`
#   done
#   #local result="Turning the bulb off..."
#   echo "----------> $result"
#   # Show the result to user (if requested)
#   if [[ $result == "Turning the bulb off..." ]]; then
#     if [[ ! $2 =~ "True" ]]; then
#       say "$(jv_pg_yl_lang turn_off_success $1)"
#     fi
#     return 0
#   else
#     if [[ ! $2 =~ "True" ]]; then
#       say "$(jv_pg_yl_lang turn_off_failed $1)"
#     fi
#   fi

#   return 1
# }



