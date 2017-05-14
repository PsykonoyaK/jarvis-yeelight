#!/bin/bash

zone_name=""

dump_zone ()
{
  echo ${jv_zones["$1"]}
}

dump_couleur ()
{
  echo ${jv_couleurs["$1"]}
}

# $1: yee command to exec
# $2: bulb ip
# $3: color_name/brightness (string/number, optional)
jv_pg_exec_yl_command_basic()
{
  # Send request to yeelight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  python $dir/yeecli/cli.py --ip=$2 $1 $3 2> /dev/null
  return $?
}

# $1: yee command to exec
# $2: bulb ip
jv_pg_exec_yl_command_pulse ()
{
  # Send request to yeelight module
  local alert_color=${jv_couleurs["rouge"]}
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  python $dir/yeecli/cli.py --ip=$2 $1 --pulses=10 "$alert_color" 2> /dev/null
  return $?
}

# $1: yee command to exec
# $2: bulb ip
jv_pg_exec_yl_command_disco ()
{
  # Send request to yeelight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  python $dir/yeecli/cli.py --ip=$2 $1 2> /dev/null
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
echo $3
  ret=0
  if [ "$cmd" == "rgb" ] && [ "$color_or_brightness" != "" ]
  then
    color_or_brightness=`dump_couleur $color_or_brightness`
  fi

  for ip in `dump_zone $zone`
  do
    if [ "$cmd" == "pulse" ]
    then
      jv_pg_exec_yl_command_pulse "$cmd" "$ip"
    elif [ "$cmd" == "disco" ]
    then
      jv_pg_exec_yl_command_disco "$cmd" "$ip"
    else
      jv_pg_exec_yl_command_basic "$cmd" "$ip" "$color_or_brightness"
    fi

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




