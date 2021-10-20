#!/bin/bash
set -e

## Download and install
git clone https://github.com/pluggemi/roon-web-controller.git
cd roon-web-controller/
#git checkout alpha
npm run build
npm audit fix #--force
npm start

## Run Program
#node /roon-web-controller/app.js
#echo Hello world!
