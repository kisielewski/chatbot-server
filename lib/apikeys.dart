import 'dart:io';

File apikeys = new File('apikeys.chatbot');

List checkApiKey(String apikey){
	bool is_apikey = false;
	String address = '';
	List<String> list  = apikeys.readAsLinesSync();
	for(int i = 0; i < list.length; i++){
		if(list[i].split(";")[0] == apikey){
			is_apikey = true;
			address = list[i].split(";")[1];
			break;
		}
	}
	return [ is_apikey, address];
}