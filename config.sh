[salon]
var_jv_pg_yl_ip1="192.168.1.25" # Yeelight IP
var_jv_pg_yl_ip2="192.168.1.61" # Yeelight IP
effect=smooth
duration=500

[chambre]
var_jv_pg_yl_ip3="192.168.1.75" # Yeelight IP
effect=smooth
duration=500

var_jv_pg_yl_port=55443 # Yeelight port
#var_jv_pg_yl_request_timeout_in_sec=5 # communication timeout

#var_jv_pg_yl_all_zone_name="maison" # Name of all zone
var_jv_pg_yl_zone_1_name="salon" # Name of the zone 1
var_jv_pg_yl_zone_2_name="chambre" # Name of the zone 2

declare -A jv_couleurs=(
  ["rouge"]="ff0000" 
  ["vert"]="00ff00" 
  ["bleu"]="0000ff"
)

declare -A jv_zones=(
  ["$var_jv_pg_yl_zone_1_name"]="$var_jv_pg_yl_ip1 $var_jv_pg_yl_ip2" 
  ["$var_jv_pg_yl_zone_2_name"]="$var_jv_pg_yl_ip3"
)


#declare -A jv_zones=(
#	["salon"]="$var_jv_pg_yl_ip1 $var_jv_pg_yl_ip2" 
#	["chambre"]="$var_jv_pg_yl_ip3"
#)

#function dump_zone() {
#  echo ${jv_zones["$1"]} 
#}


#dump_zone salon
#dump_zone chambre

#myz=salon

# Loop ips of zones : 
#for ip in `dump_zone *`
#do
	#echo "Ip i : $ip"
#done
