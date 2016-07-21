#!/bin/sh

ACTION=$1
APP_TYPE=$2
APP_NAME=$3

help() {
  echo ""
  echo "    expez - A simple script that sets up project structures for express.js apps.";
  echo ""
  echo "    expez create [mvc] - creates an express app folder structure";
}

make_dir() {
  if [[ $1 = mvc ]]; then
    echo "making $1 folder structure for: $APP_NAME"
    mkdir -p $APP_NAME
    mkdir -p $APP_NAME/public/javascript/lib
    mkdir -p $APP_NAME/public/javascript/scripts
    mkdir -p $APP_NAME/public/stylesheets
    mkdir -p $APP_NAME/views
    mkdir -p $APP_NAME/views/partials
    mkdir -p $APP_NAME/models
    mkdir -p $APP_NAME/routes

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

fill_in_app() {
  echo "var express = require(\"express\"),\n    app = express();"  >> app.js
  echo  >> app.js
  echo "app.set(\"view engine\", \"ejs\");"  >> app.js
  echo "app.use(express.static(__dirname + '/public'));"  >> app.js
  echo  >> app.js
  echo "app.get('/', function(req, res) {"  >> app.js
  echo "   res.send('Welcome to the Home Page');"  >> app.js
  echo "});"  >> app.js
  echo  >> app.js
  echo "app.listen(process.env.PORT, function() {"  >> app.js
  echo "  console.log(\"Listening on PORT: \" + process.env.PORT)"  >> app.js
  echo "})"  >> app.js
}

export_port() {
  export PORT=3000
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
        if [[ $2 = "mvc" ]]; then
          make_dir mvc;
        fi
      fi
      export_port;
      npm_init;
      npm_install_dependencies;
      fill_in_app;
    ;;
  esac
fi
