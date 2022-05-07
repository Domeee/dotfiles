#!/bin/bash

if [[ -n `nvr --serverlist | grep unity` ]]; then
  nvr --servername unity --remote-silent $@
else
  kitty -- nvr --servername unity --remote-silent $@
fi
