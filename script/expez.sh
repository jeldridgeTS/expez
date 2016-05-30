#!/bin/sh

function help() {
  echo ""
  echo "    expez - A simple script that sets up project structures for express.js apps.";
  echo ""
  echo "    expez create [basic] or [mvc] - creates an express app folder structure";
}

function create() {
  echo "I am create"
}

if [[ $1 ]]; then
  case "$1" in
    "help" )
      help;
    ;;
    "create" )
      if [[ $3 = "" ]]; then
        echo "You need an app root name"
      else
        if [[ $2 = "basic" ]]; then
          mkdir -p $3 # TODO mkdir func for mvc structure
        elif [[ $2 = "mvc" ]]; then
          mkdir -p $3 # TODO mkdir func for mvc structure
        fi
      fi
      create;
    ;;
  esac
fi
