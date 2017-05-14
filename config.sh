var_jv_pg_yl_ip1="192.168.1.61" # Yeelight IP
var_jv_pg_yl_ip2="192.168.1.75" # Yeelight IP
var_jv_pg_yl_ip3="192.168.1.25" # Yeelight IP

var_jv_pg_yl_port=55443 # Yeelight port

var_jv_pg_yl_all_zone_name="maison" # Name of all zone
var_jv_pg_yl_zone_1_name="salon" # Name of the zone 1
var_jv_pg_yl_zone_2_name="chambre" # Name of the zone 2

declare -A jv_couleurs=(
  # [""]=""
  ["blanc"]="ffffff"
  ["blanche"]="ffffff"
  ["rouge"]="ff0000" 
  ["vert"]="00ff00" 
  ["bleu"]="0000ff"
  ["bleu ciel"]="77B5FE"
  ["bleu nuit"]="0F056B"
  ["jaune"]="FCDC12"
  ["rose"]="DF73FF"
  ["orange"]="FF7F00"
  ["violet"]="7F00FF"
)

declare -A jv_zones=(
  ["$var_jv_pg_yl_all_zone_name"]="$var_jv_pg_yl_ip1 $var_jv_pg_yl_ip2 $var_jv_pg_yl_ip3" 
  ["$var_jv_pg_yl_zone_1_name"]="$var_jv_pg_yl_ip1 $var_jv_pg_yl_ip2" 
  ["$var_jv_pg_yl_zone_2_name"]="$var_jv_pg_yl_ip3"
)
