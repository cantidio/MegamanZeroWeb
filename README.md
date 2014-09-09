[![Build Status](https://drone.io/github.com/cantidio/MegamanZeroWeb/status.png)](https://drone.io/github.com/cantidio/MegamanZeroWeb/latest)
[![Stories in Ready](https://badge.waffle.io/cantidio/MegamanZeroWeb.png?label=ready&title=Ready)](https://waffle.io/cantidio/MegamanZeroWeb)
MegamanZeroWeb
==============

Megaman Game with multiplayer playability implemented in Dart

Try the last successful build on <a href="http://megamandart.herokuapp.com" target="_blank">Heroku</a>


Steps followed to get deploy working on Heroku:
```
heroku login
heroku git:clone -a megamandart
cd megamandart
heroku config:set BUILDPACK_URL=https://github.com/selkhateeb/heroku-buildpack-dart.git
#heroku config:set DART_SDK_URL=https://github.com/selkhateeb/heroku-vagrant-dart-build/releases/download/latest/dart-sdk.tar
heroku config:set DART_SDK_URL=https://www.dropbox.com/s/hxh64kesz2xw6sy/dart-sdk.tar
heroku ps:scale  web=1
```
