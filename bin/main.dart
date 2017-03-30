import 'dart:io';
import '../lib/check_files.dart';
import '../lib/http_server.dart';
import '../lib/http_admin_server.dart';

void main() {
  if (!checkFiles()) exit(2);
  runServer();
  runAdminServer();
}
