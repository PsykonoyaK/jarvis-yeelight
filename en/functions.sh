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
#        i_check) echo "I check...";;
#        the_answer_is) echo "This answer is $2";;
#    esac
#} 

jv_pg_yl_lang()
{
  # "$1" : $cmd
  # "$2" : success
  # "$3" : $zone
  cmd="$1"
  result="$2"
  zone="$3"

  # Success case
  if [[ "$result" == "success" ]]
    then
      case "$1" in
        "turn on") echo "The $zone is illuminated";;
        "turn off") echo "The $zone is off";;
        "rgb") echo "The $zone area has changed in ambience color";;
        "brightness") echo "I changed the brightness of the $zone";;
        "pulse") echo "The $zone is in alert mode";;
		"disco") echo "It's disco time in the $zone";;
        *) jv_error "Error: Translation key '$1' not recognized. Please contact the designer of this plugin.";;
      esac
    # Failed case
    else
      case "$1" in
        "turn on") echo "I can't turn on the $zone";;
        "turn off") echo "I can't turn off the $zone";;
        "rgb") echo "I couldn't change the ambience color in the $zone";;
        "brightness") echo "I couldn't change the brightness in the $zone";;
        "pulse") echo "I couldn't alert the $zone";;
      	"disco") echo "I couldn't launch the disco mode in the $zone";;
        *) jv_error "Error: Translation key '$1' not recognized. Please contact the designer of this plugin.";;
      esac
  fi
}
