import 'dart:io';
import 'dart:convert';

import 'database.dart';
import 'bot_select.dart';
import 'log.dart';
import 'apikeys.dart';

const VERSION = '0.0.0 testing';
const AUTHOR = 'Patryk Kisielewski';
const BOT = 'ONLINE';

void sendWrongApikey(HttpRequest request) {
  Map map = new Map();
  map['status'] = 'ERROR';
  map['error'] = new Map();
  map['error']['info'] = "wrong apikey";
  map['error']['code'] = 2;
  request.response.writeln(JSON.encode(map));
  request.response.close();
  log("apikey|wrong|" + getIPAddress(request));
}

sendNotFound(HttpRequest request) {
  Map map = new Map();
  map['status'] = 'ERROR';
  map['error'] = new Map();
  map['error']['info'] = "wrong address";
  map['error']['code'] = 1;
  request.response.writeln(JSON.encode(map));
  request.response.close();
}

void sendStatus(HttpRequest request) {
  List apiKey = checkApiKey(request.uri.queryParameters['apikey']);
  if (apiKey[0] == false) {
    sendWrongApikey(request);
    return;
  }
  Map map = new Map();
  map['status'] = 'OK';
  map['bot'] = BOT;
  map['server'] = new Map();
  map['server']['version'] = VERSION;
  map['server']['author'] = AUTHOR;
  request.response.headers.add("Access-Control-Allow-Origin", apiKey[2]);
  request.response.writeln(JSON.encode(map));
  request.response.close();
}

void sendAnswer(HttpRequest request) {
  List apiKey = checkApiKey(request.uri.queryParameters['apikey']);
  if (apiKey[0] == false) {
    sendWrongApikey(request);
    return;
  }
  Map map = new Map();
  if (checkIsNull(request.uri, 'useranswer')) {
    map['status'] = 'ERROR';
    map['error'] = new Map();
    map['error']['info'] = "useranswer is null";
    map['error']['code'] = 3;
    request.response.writeln(JSON.encode(map));
    request.response.close();
    return;
  }
  map['status'] = 'OK';
  map['data'] = new Map();
  map['data']['botanswer'] =
      selectAnswer(request.uri.queryParameters['useranswer']);
  map['data']['userquestion'] = map['data']['botanswer'];
  request.response.headers.add("Access-Control-Allow-Origin", apiKey[2]);
  request.response.writeln(JSON.encode(map));
  request.response.close();
  if (!checkIsNull(request.uri, 'userquestion'))
    insertAnswer(request.uri.queryParameters['userquestion'],
        request.uri.queryParameters['useranswer']);
  logAnswer(request, apiKey[1]);
}

bool checkIsNull(Uri uri, String key) {
  if (!uri.queryParameters.containsKey(key)) return true;
  if (uri.queryParameters[key] == '') return true;
  if (uri.queryParameters[key] == null) return true;
  if (uri.queryParameters[key] == 'null') return true;
  if (uri.queryParameters[key] == 'Null') return true;
  //if(uri.queryParameters[key].isEmpty) return true;
  return false;
}
