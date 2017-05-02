#!/bin/bash
# Here you can define translations to be used in the plugin functions file
# the below code is an sample to be reused:
# 1) uncomment to function below
# 2) replace XXX by your plugin name (short)
# 3) remove and add your own translations
# 4) you can the arguments $2, $3 passed to this function
# 5) in your plugin functions.sh file, use it like this:
#      say "$(pv_myplugin_lang the_answer_is "oui")"
#      => Jarvis: La réponse est oui

#pv_XXX_lang () {
#    case "$1" in
#        i_check) echo "Je regarde...";;
#        the_answer_is) echo "La réponse est $2";;
#    esac
#}

jv_pg_yl_lang()
{
  case "$1" in
    mac_address_is) echo "L'adresse mac du module milight est $2";;
    invalid_mac_address) echo "Impossible de récupérer l'adresse mac du module milight...";;
    turn_on_success) zone_name=""; jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name allumée";;
    turn_on_failed) zone_name=""; jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec de l'allumage des lumières de la zone $zone_name";;
    turn_off_success) zone_name=""; jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name éteinte";;
    turn_off_failed) zone_name=""; jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec de l'extinction des lumières de la zone $zone_name";;
    turn_on_wifi_bridge_lamp_success) echo "Lampe du module allumée";;
    turn_on_wifi_bridge_lamp_failed) echo "Echec de l'allumage de la lampe du module";;
    turn_off_wifi_bridge_lamp_success) echo "Lampe du module éteinte";;
    turn_off_wifi_bridge_lamp_failed) echo "Echec de l'extinction de la lampe du module";;
    turn_on_night_mode_success) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Mode nuit activé pour la zone $zone_name";;
    turn_on_night_mode_failed) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec du lancement du mode nuit de la zone $zone_name";;
    turn_on_disco_mode_success) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Mode disco $3 activé pour la zone $zone_name";;
    turn_on_disco_mode_failed) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec du lancement du mode disco $3 de la zone $zone_name";;
    speed_up_disco_mode_success) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Mode disco plus rapide pour la zone $zone_name";;
    speed_up_disco_mode_failed) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec de l'augmentation de vitesse du mode disco de la zone $zone_name";;
    slow_down_disco_mode_success) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Mode disco plus lent pour la zone $zone_name";;
    slow_down_disco_mode_failed) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec de la diminution de vitesse du mode disco de la zone $zone_name";;
    set_color_success) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Couleur $3 activée pour la zone $zone_name";;
    set_color_failed) jv_pg_yl_zone_id_to_zone_name $2 zone_name; echo "Echec de l'activation de la couleur $3 pour la zone $zone_name";;

    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
