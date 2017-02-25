import 'dart:io';

import 'package:chatbot_server/log.dart';
//import 'package:chatbot_server/http_response.dart';

HttpServer admin_server;
const ADMIN_PORT = 4042;

runAdminServer() async {
	admin_server = await HttpServer.bind(InternetAddress.ANY_IP_V4, ADMIN_PORT);
	log("admin_server|start|"+ADMIN_PORT.toString());
	await for (HttpRequest request in admin_server) {
		print(request.method);
		print(request.toString());
		print(request.requestedUri.toString());

	}
}