import 'dart:io';

import 'package:chatbot_server/log.dart';
import 'package:chatbot_server/apikeys.dart';
import 'package:chatbot_server/http_response.dart';

HttpServer server;
const PORT = 4041;

runServer() async {
	server = await HttpServer.bind(InternetAddress.ANY_IP_V4, PORT);
	log("Start http server on port "+PORT.toString());
	await for (HttpRequest request in server) {
		final String path = request.uri.path;
		List apiinfo = checkApiKey(request.uri.queryParameters['apikey']);
		switch (path) {
			case '/status':
			case '/status/':
				if(!apiinfo[0]){
					sendWrongApiKey(request.response);
					log("Wrong apikey from "+request.headers.value('X-Forwarded-For'));
					break;
				}
				sendStatus(request.response, request.uri.queryParameters['apikey'], apiinfo[1]);
				break;
			case '/ask':
			case '/ask/':
				if(!apiinfo[0]){
					sendWrongApiKey(request.response);
					log("Wrong apikey from "+request.connectionInfo.remoteAddress.address);
					break;
				}
				sendAnswer(request, apiinfo[1]);
				logAnswer(request);
				break;
			default:
				sendNotFound(request.response);
		}
	}
}