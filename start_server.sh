#!/bin/bash
# Generic minecraft server starter
# Requires tmux for backgrounding
# Version 0.5

# Variables
server_name="${PWD##*/}"
arg=$1
script_name=$0

# Options
server_jar="server.jar"
max_ram="4G"
min_ram="512M"
jvm_args="-XX:+AggressiveOpts -XX:ParallelGCThreads=2 -XX:+CMSIncrementalPacing	-XX:+UseConcMarkSweepGC -XX:+UseParNewGC"

# Start function
function start {
  echo "Foreground process starting"
  java -server -Xmx${max_ram} -Xms${min_ram} ${jvm_args} -jar ${server_jar} nogui && exit 1
}

function daemon {
  tmux new -Pds "${server_name}" "./${script_name} foreground";
  echo "tmux daemon started"
}

function list_help {
  echo "start_server.sh [foreground|background]"
  exit 1
}

function main {
  cd "${0%/*}";
  case $arg in
    foreground) start;;
    background) daemon;;
    *) list_help;;
  esac
}

main
