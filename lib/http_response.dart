import 'dart:io';
import 'dart:convert';

import 'package:chatbot_server/database.dart';
import 'package:chatbot_server/text_operation.dart';

const VERSION = '0.0.0 testing';
const AUTHOR = 'Patryk Kisielewski';
const BOT = 'ONLINE';

sendWrongApiKey(HttpResponse response) {
	var map = new Map();
	map['status'] = 'ERROR';
	map['info'] = "wrong apikey";
	response..writeln(JSON.encode(map));
	response.close();
}

sendNotFound(HttpResponse response){
	var map = new Map();
	map['status'] = 'ERROR';
	map['info'] = "wrong address";
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

sendAnswer(HttpRequest request, String api){
	var map = new Map();
	if(checkIsNull(request.uri, 'useranswer')){
		map['status'] = 'ERROR';
		map['info'] = "useranswer is null";
		request.response..writeln(JSON.encode(map));
		request.response.close();
		return;
	}
	map['status'] = 'OK';
	map['data'] = new Map();
	map['data']['botanswer'] = selectAnswer(request.uri.queryParameters['useranswer']);
	map['data']['userquestion'] = map['data']['botanswer'];
	request.response.headers.add("Access-Control-Allow-Origin", api);
	request.response..writeln(JSON.encode(map));
	request.response.close();
	if(!checkIsNull(request.uri, 'userquestion')) insertAnswer(request.uri.queryParameters['userquestion'], request.uri.queryParameters['useranswer']);
}

bool checkIsNull(Uri uri, String key){
	if(!uri.queryParameters.containsKey(key)) return true;
	if(uri.queryParameters[key] == '') return true;
	if(uri.queryParameters[key] == null) return true;
	if(uri.queryParameters[key] == 'null') return true;
	if(uri.queryParameters[key] == 'Null') return true;
	//if(uri.queryParameters[key].isEmty) return true;
	return false;
}