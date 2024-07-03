import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterforge/presentation/forge_app.dart';
import 'package:hive/hive.dart';

import 'di/get_it.dart' as getIt;
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ));
  unawaited(getIt.init());

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(const ForgeApp());
}
