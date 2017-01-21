import 'dart:io';

import 'package:chatbot_server/global.dart';
import 'package:chatbot_server/formating.dart';

Future firstRecord() async {
	IOSink databaseb = database.openWrite(mode: FileMode.APPEND);
	databaseb.writeln("Who are you?;I'm ChatBot.");
	await databaseb.close();
}