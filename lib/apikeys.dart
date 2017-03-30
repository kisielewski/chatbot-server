import 'dart:io';

File apiKeys = new File('apikeys.chatbot');

List checkApiKey(String apiKey) {
  bool isApiKey = false;
  String id = '';
  String address = '';
  List<String> list = apiKeys.readAsLinesSync();
  for (int i = 0; i < list.length; i++) {
    if (list[i].split("|")[1] == apiKey) {
      isApiKey = true;
      id = list[i].split("|")[0];
      address = list[i].split("|")[2];
      break;
    }
  }
  return [isApiKey, id, address];
}
