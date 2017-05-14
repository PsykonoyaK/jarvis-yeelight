## Description
Control wireless Yeelights with <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a>.


<img src="https://raw.githubusercontent.com/PsykonoyaK/jarvis-yeelight/master/yeelight.jpg" width="200">


## Usage
```
You: Allume le salon/chambre/maison
Jarvis: La zone salon/chambre/maison est allumée

You: Eteins le salon/chambre/maison
Jarvis: La zone salon/chambre/maison est éteinte

You: Change l'ambiance du salon/chambre/maison en bleu/rouge/...
Jarvis: La zone $zone a changé de couleur d'ambiance

You: Augmente la luminosité du salon/chambre/maison
Jarvis: J'ai changé la luminosité de la zone $zone

You: Baisse la luminosité du salon/chambre/maison
Jarvis: J'ai changé la luminosité de la zone $zone

You: Change la luminosité du salon/chambre/maison à 50%
Jarvis: J'ai changé la luminosité de la zone $zone

You: Active l'alerte dans le salon/chambre/maison
Jarvis: La zone $zone est en mode alerte

You: Active l'alerte dans le salon/chambre/maison
Jarvis: C'est ambiance disco dans la zone $zone

```

## How to install

1) Connect your Yeelight Color Bulb and install the MiHome app from <a target="_blank" href="https://play.google.com/store/apps/details?id=com.xiaomi.smarthome&hl=fr">Google Play</a> or <a target="_blank" href="https://itunes.apple.com/us/app/mi-home-xiaomi-for-your-smarthome/id957323480?mt=8">Apple store</a>.

2) Get the IPs of your bulbs

3) Install this plugin using this command line ```./jarvis.sh -p https://github.com/PsykonoyaK/jarvis-yeelight```

4) Edit <a target="_blank" href="https://github.com/PsykonoyaK/jarvis-yeelight/blob/master/config.sh">config.sh</a> with the bulbs IPs. And define the name of your zones, add more ambient colors

5) Edit the <a target="_blank" href="https://github.com/PsykonoyaK/jarvis-yeelight/blob/master/fr/commands">commands</a> with your desired keywords

## Author
[Tony WONG]

