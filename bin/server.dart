import 'dart:io' show File, HttpServer, Platform;
import 'package:start/start.dart';

main() {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  print("port: $port");
  start(host: '0.0.0.0', port: port).then((Server app) {
    app.static('../build/web');
  });
}