import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code)));

  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguage) {
      yield LanguageLoaded(locale: Locale(event.language.code));
    }
  }
}
