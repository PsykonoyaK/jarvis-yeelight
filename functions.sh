#!/bin/bash
jv_pg_ww_check_weather () {
	say $var_jv_pg_yl_ip2
}
# $1: zone id
# $2 (return value): zone name
jv_pg_yl_zone_id_to_zone_name ()
{
  case "$1" in
    0) eval "$2='$var_jv_pg_yl_all_zone_name'";;
    1) eval "$2='$var_jv_pg_yl_zone_1_name'";;
    2) eval "$2='$var_jv_pg_yl_zone_2_name'";;
    3) eval "$2='$var_jv_pg_yl_zone_3_name'";;
    4) eval "$2='$var_jv_pg_yl_zone_4_name'";;
    *) jv_error "Error: Zone ID '$1' does not exist, don't use it in command file!";;
  esac
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_yl_turnOnAndWhite ()
{
  # Send request to milight module
  #local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  #local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_yl_ip --port $var_jv_pg_yl_port --timeout $var_jv_pg_yl_request_timeout_in_sec --zone $1 --turnOn --setWhiteMode`
  bulb2.turn_on()
  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_yl_lang turn_on_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_yl_lang turn_on_failed $1)"
    fi
  fi

  return 1
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_yl_turnOff ()
{
  say "hello"
  # Send request to milight module
  #local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  #local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --setWhiteMode --turnOff`
  
  echo var_jv_pg_yl_ip1
  from yeelight import Bulb

  bulb1 = Bulb(var_jv_pg_yl_ip1)
  bulb2 = Bulb(var_jv_pg_yl_ip2)
  bulb3 = Bulb(var_jv_pg_yl_ip3)

  local result=`python bulb2.turn_off()`
  
  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_yl_lang turn_off_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_yl_lang turn_off_failed $1)"
    fi
  fi

  return 1
}
