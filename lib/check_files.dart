import 'dart:io';

import 'package:chatbot_server/global.dart';
import 'package:chatbot_server/formating.dart';
import 'package:chatbot_server/logfile.dart';

bool checkFiles(){
	var logs = new Directory('logs');
	logs.createSync(recursive: true);
	if(logs.existsSync() == false){
		print("Error: Directory 'logs' not created");
		return false;
	}	
	logfile = new File(logfileName());
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
	}
	if(database.existsSync() == false){
		log("Error: Database file not created");
		return false;
	}
	log("Check files done");
}