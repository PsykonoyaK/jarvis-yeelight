#!/bin/bash

# Install Python (python 3.x)
[[ -z $(which python) ]] && sudo apt-get install python
[[ -z $(which python3) ]] && sudo apt-get install python3

sudo apt-get update && sudo apt-get install python-pip && sudo pip install yeelight

# Copy latest version of yeecli python script
wget -P yeecli/ https://raw.githubusercontent.com/skorokithakis/yeecli/master/yeecli/__init__.py
wget -P yeecli/ https://raw.githubusercontent.com/skorokithakis/yeecli/master/yeecli/cli.py
