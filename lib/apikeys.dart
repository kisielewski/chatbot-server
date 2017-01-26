import 'dart:io';

File apikeys = new File('apikeys.chatbot');

List checkApikey(String apikey){
	bool is_apikey = false;
	String id = '';
	String address = '';
	List<String> list  = apikeys.readAsLinesSync();
	for(int i = 0; i < list.length; i++){
		if(list[i].split("|")[1] == apikey){
			is_apikey = true;
			id = list[i].split("|")[0];
			address = list[i].split("|")[2];
			break;
		}
	}
	return [ is_apikey, id, address];
}