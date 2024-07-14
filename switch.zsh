#!/bin/zsh -e
QUIT_APP="/Applications/Docker.app/Contents/MacOS/Docker Desktop.app/Contents/MacOS/Docker Desktop"
ACTIVATE_APP="/Applications/OrbStack.app/Contents/MacOS/OrbStack"
CONTEXT="orbstack"
if [ $(docker context show) = "orbstack" ]; then
  QUIT_APP="/Applications/OrbStack.app/Contents/MacOS/OrbStack"
  ACTIVATE_APP="/Applications/Docker.app/Contents/MacOS/Docker Desktop.app/Contents/MacOS/Docker Desktop"
  CONTEXT="desktop-linux"
fi

ps axww | grep "${QUIT_APP}" | grep -v grep | perl -lane 'print $F[0]' | xargs kill
nohup "${ACTIVATE_APP}"  > /dev/null 2>&1 < /dev/null &

docker context use ${CONTEXT}
