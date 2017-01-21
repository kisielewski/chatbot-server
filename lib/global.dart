import 'dart:io';

import 'package:chatbot_server/formating.dart';

const PORT = 4041;
const VERSION = '0.0.0 testing';
const AUTHOR = 'Patryk Kisielewski';
const BOT = 'ONLINE';

var logfile = new File(logfileName());
var apikeys = new File('apikeys.chatbot');
var database = new File('database.chatbot');

HttpServer server;