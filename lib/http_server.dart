import 'dart:io';

import 'package:chatbot_server/log.dart';
import 'http_response.dart';

HttpServer server;
const PORT = 4041;

runServer() async {
  server = await HttpServer.bind(InternetAddress.ANY_IP_V4, PORT);
  log("server|start|" + PORT.toString());
  await for (HttpRequest request in server) {
    final String path = request.uri.path;
    switch (path) {
      case '/status':
      case '/status/':
        sendStatus(request);
        break;
      case '/ask':
      case '/ask/':
        sendAnswer(request);
        break;
      default:
        sendNotFound(request);
    }
  }
}
