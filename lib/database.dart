import 'dart:io';

import 'package:chatbot_server/global.dart';

void firstRecord(){
	database.writeAsStringSync("Who are you?;I'm ChatBot.;v"+'\r\n', mode: FileMode.APPEND);
}