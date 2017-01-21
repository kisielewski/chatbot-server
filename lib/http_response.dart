import 'dart:io';
import 'dart:convert';

import 'package:chatbot_server/global.dart';

sendWrongApiKey(HttpResponse response) {
	var map = new Map();
	map['status'] = 'ERROR';
	map['info'] = "Wrong apikey";
	response..writeln(JSON.encode(map));
	response.close();
}

sendNotFound(HttpResponse response){
	var map = new Map();
	map['status'] = 'ERROR';
	map['info'] = "Wrong address";
	response..writeln(JSON.encode(map));
	response.close();
}

sendStatus(HttpResponse response, String apikey, String api){
	var map = new Map();
	map['status'] = 'OK';
	map['bot'] = BOT;
	map['server'] = new Map();
	map['server']['version'] = VERSION;
	map['server']['author'] = AUTHOR;
	response.headers.add("Access-Control-Allow-Origin", api);
	response..writeln(JSON.encode(map));
	response.close();
}

sendAnswer(HttpResponse response, String question, String answer, String api){
	var map = new Map();
	map['status'] = 'OK';
	map['data'] = new Map();
	map['data']['botanswer'];
	map['data']['botquestion'];
	response.headers.add("Access-Control-Allow-Origin", api);
	response..writeln(JSON.encode(map));
	response.close();
}