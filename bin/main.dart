import 'dart:io';
import '../lib/check_files.dart';
import '../lib/http_server.dart';

void main() {
	if(checkFiles() == false){
		exit(2);
	}
	runServer();
}
