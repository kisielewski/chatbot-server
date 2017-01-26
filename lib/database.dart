import 'dart:io';

File database = new File('database.chatbot');

void firstRecord(){
	database.writeAsStringSync("Who are you?|I'm ChatBot.|v"+'\r\n', mode: FileMode.APPEND);
}

void insertAnswer(String key, String val){
	database.writeAsStringSync(key.replaceAll('|', '')+'|'+val.replaceAll('|', '')+'|u'+'\r\n', mode: FileMode.APPEND);
}
