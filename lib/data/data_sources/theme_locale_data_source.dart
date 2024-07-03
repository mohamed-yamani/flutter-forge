import 'dart:async';

import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';
import 'package:hive/hive.dart';

abstract class ThemeLocaleDataSource {
  Future<void> updateTheme(Themes theme);
  Future<String?> getPreferredTheme();
}

class ThemeLocaleDataSourceImpl implements ThemeLocaleDataSource {
  @override
  Future<void> updateTheme(Themes theme) async {
    final themeBox = await Hive.openBox('themeBox');
    if (theme == Themes.dark) {
      unawaited(themeBox.put('preferredTheme', 'dark'));
    } else {
      unawaited(themeBox.put('preferredTheme', 'light'));
    }
  }

  @override
  Future<String?> getPreferredTheme() async {
    final box = await Hive.openBox('themeBox');
    if (box.get('preferredTheme') != null) {
      return box.get('preferredTheme');
    } else {
      return Future.value(null);
    }
  }
}
