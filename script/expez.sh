#!/bin/sh

ACTION=$1
APP_TYPE=$2
APP_NAME=$3

help() {
  echo ""
  echo "    expez - A simple script that sets up project structures for express.js apps.";
  echo ""
  echo "    expez create [basic] or [mvc] - creates an express app folder structure";
}

make_dir() {
  if [[ $1 = basic ]]; then
    echo "making $1 folder structure for: $APP_NAME"
    mkdir -p $APP_NAME
    mkdir -p $APP_NAME/public/javascript/lib
    mkdir -p $APP_NAME/public/javascript/scripts
    mkdir -p $APP_NAME/views
    mkdir -p $APP_NAME/views/partials

    touch $APP_NAME/app.js
    touch $APP_NAME/views/partials/header.ejs
    touch $APP_NAME/views/partials/footer.ejs
  elif [[ $1 = mvc ]]; then
    echo "making $1 folder structure for: $APP_NAME"
  fi
}

npm_init() {
  cd $APP_NAME
  npm init
}

npm_install_dependencies() {
  npm install --save express ejs request
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
          make_dir basic;
        elif [[ $2 = "mvc" ]]; then
          make_dir mvc;
        fi
      fi
      npm_init;
      npm_install_dependencies;
    ;;
  esac
fi
