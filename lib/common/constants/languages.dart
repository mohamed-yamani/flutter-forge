import 'package:flutterforge/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(value: 'English', code: 'en'),
    LanguageEntity(value: 'French', code: 'fr'),
    LanguageEntity(value: 'Arabic', code: 'ar'),
  ];
}
