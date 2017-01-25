import 'dart:io';

import 'package:chatbot_server/log.dart';
import 'package:chatbot_server/database.dart';
import 'package:chatbot_server/apikeys.dart';

bool checkFiles(){
	Directory logs = new Directory('logs');
	logs.createSync(recursive: true);
	if(logs.existsSync() == false){
		print("Error: Directory 'logs' not created");
		return false;
	}
	logfile.createSync(recursive: true);
	if(logfile.existsSync()){
		print("Log file created");
	} else {
		print("Error: Log file not created");
		return false;
	}
	apikeys.createSync(recursive: true);
	if(apikeys.existsSync() == false){
		log("Error: ApiKeys file not created");
		return false;
	}
	if(database.existsSync() == false){
		database.createSync(recursive: true);
		firstRecord();
		log("Create database and add first record");
	}
	if(database.existsSync() == false){
		log("Error: Database file not created");
		return false;
	}
	log("Files checked");
	return true;
}