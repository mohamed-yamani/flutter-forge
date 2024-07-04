import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocaleDataSource {
  Future<void> updateLanguage(String languageCode);
  Future<String?> getPreferredLanguage();
}

class LanguageLocaleDataSourceImpl implements LanguageLocaleDataSource {
  @override
  Future<String?> getPreferredLanguage() async {
    final box = await Hive.openBox('languageBox');
    if (box.get('preferredLanguage') == null) {
      return Future.value(null);
    } else {
      return box.get('preferredLanguage');
    }
    // return box.get('preferredLanguage');
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    final languageBox = await Hive.openBox('languageBox');
    unawaited(languageBox.put('preferredLanguage', languageCode));
  }
}
