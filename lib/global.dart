import 'dart:io';

import 'package:chatbot_server/formating.dart';

var logfile = new File(logfileName());
var apikeys = new File('apikeys.chatbot');
var database = new File('database.chatbot');