import 'dart:io';

import 'package:chatbot_server/global.dart';
import 'package:chatbot_server/formating.dart';

Future log(String data) async {
	IOSink logfileb = logfile.openWrite(mode: FileMode.APPEND);
	logfileb.writeln(currentDate()+';'+data);
	await logfileb.close();
	print(data);
}