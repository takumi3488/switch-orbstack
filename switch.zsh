#!/bin/zsh -e
QUIT_APP="Docker"
ACTIVATE_APP="OrbStack"
if [ $(docker context show) = "orbstack" ]; then
  QUIT_APP="OrbStack"
  ACTIVATE_APP="Docker"
fi

osascript -e "tell application \"${QUIT_APP}\" to quit"
osascript -e "tell application \"${ACTIVATE_APP}\" to activate"
