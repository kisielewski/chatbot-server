import 'package:chatbot_server/global.dart';

List checkApiKey(String apikey){
	bool is_apikey = false;
	String address = '';
	var list  = apikeys.readAsLinesSync();
	for(var i = 0; i < list.length; i++){
		if(list[i].split(";")[0] == apikey){
			is_apikey = true;
			address = list[i].split(";")[1];
			break;
		}
	}
	return [ is_apikey, address];
}