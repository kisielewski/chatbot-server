import 'dart:io';

import 'package:chatbot_server/global.dart';
import 'package:chatbot_server/formating.dart';

void log(String data) async {
	logfile.writeAsStringSync(currentDate()+';'+data+'\r\n', mode: FileMode.APPEND);
	print(data);
}