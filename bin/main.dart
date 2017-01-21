import 'package:chatbot_server/check_files.dart';

void main() {
	if(checkFiles() == false){
		exit(2);
	}
}