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
	
  # "$1" : $cmd
  # "$2" : success 
  # "$3" : zone
  cmd="$1"
  result="$2"
  zone="$3"

  # Success casee
  if [[ "$result" == "success" ]]
    then
  	  case "$1" in
      "turn on") echo "La zone $zone éclairée";;
      "turn off") echo "La zone $zone éteinte";;
      "rgb") echo "La zone $zone a changé de couleur d'ambiance";;
  		*) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  	  esac
    # Failed case
    else
  	  case "$1" in
      "turn on") echo "Je n'arrive pas à allumer la zone $zone";;
      "turn off") echo "Je n'arrive pas à éteindre la zone $zone";;
      "rgb") echo "Je n'ai pas pu changer la couleur d'ambiance dans la zone $zone";;
  		*) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  	  esac
  fi
}
