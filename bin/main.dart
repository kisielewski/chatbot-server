import 'dart:io';
import 'package:chatbot_server/check_files.dart';
import 'package:chatbot_server/http_server.dart';

void main() {
	if(checkFiles() == false){
		exit(2);
	}
	runServer();
}