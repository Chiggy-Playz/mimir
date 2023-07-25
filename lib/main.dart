import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  // Intialize hive   
  var path = (await path_provider.getApplicationDocumentsDirectory()).path;

  Hive.initFlutter(path);

  runApp(ProviderScope(child: getApp()));
}
