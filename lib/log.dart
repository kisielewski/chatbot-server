import 'dart:io';

import 'package:chatbot_server/formating.dart';

File logfile = new File(logfileName());

void log(String data) {
	logfile.writeAsStringSync(currentDate()+'|'+data+'\r\n', mode: FileMode.APPEND);
	print(data);
}

void logAnswer(HttpRequest request){
	String data = "ask;";
	if(request.uri.queryParameters.containsKey('userquestion')) data += request.uri.queryParameters['userquestion'];
	data += '|';
	if(request.uri.queryParameters.containsKey('useranswer')) data += request.uri.queryParameters['useranswer'];
	data += '|'+request.headers.value('X-Forwarded-For').toString();
	log(data);
}