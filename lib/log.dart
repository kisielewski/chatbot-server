import 'dart:io';

import 'package:chatbot_server/formating.dart';

File logfile = new File(logfileName());

void log(String data) {
	logfile.writeAsStringSync(currentDate()+'|'+data+'\r\n', mode: FileMode.APPEND);
	print(data);
}

void logAnswer(HttpRequest request, String id){
	String data = "ask|";
	if(request.uri.queryParameters.containsKey('userquestion')) data += request.uri.queryParameters['userquestion'];
	data += '|';
	if(request.uri.queryParameters.containsKey('useranswer')) data += request.uri.queryParameters['useranswer'];
	data += '|'+getIPAddress(request)+'|'+id;
	log(data);
}

String getIPAddress(HttpRequest request){
	if(request.headers.value('X-Forwarded-For') != null)
		return request.headers.value('X-Forwarded-For').toString();
	return request.connectionInfo.remoteAddress.address.toString();
}