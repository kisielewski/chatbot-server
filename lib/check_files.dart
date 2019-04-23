import 'dart:io';

import 'log.dart';
import 'database.dart';
import 'apikeys.dart';

bool checkFiles(){
	Directory logs = new Directory('logs');
	logs.createSync(recursive: true);
	if(logs.existsSync() == false){
		print("files|error|directory 'logs' not created");
		return false;
	}
	logfile.createSync(recursive: true);
	if(logfile.existsSync()){
		print("files|created|log");
	} else {
		print("files|error|log file not created");
		return false;
	}
	apikeys.createSync(recursive: true);
	if(apikeys.existsSync() == false){
		log("files|error|apikeys file not created");
		return false;
	}
	if(database.existsSync() == false){
		database.createSync(recursive: true);
		firstRecord();
		log("files|create|database and add first record");
	}
	if(database.existsSync() == false){
		log("files|error|database file not created");
		return false;
	}
	log("files|checked");
	return true;
}
