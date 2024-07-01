import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguagesEvent, LanguagesState> {
  LanguageBloc()
      : super(LanguageLoadedState(
          Locale(Languages.languages[2].code),
        )) {
    on<ToggleLanguagesEvent>((event, emit) async {
      // await updateLanguage(event.language.code);
      emit(LanguageLoadedState(
          Locale(event.language.code, event.language.code)));
    });
    on<LoadPreferredLanguagesEvent>((event, emit) async {
      // loadingBloc.add(StartLoading());
      emit(const LanguageLoadingState());
      // final language = await getPreferredLanguage(NoParams());
      emit(LanguageLoadedState(
          Locale(Languages.languages[2].code, Languages.languages[2].code)));
      // loadingBloc.add(StopLoading());
    });
  }
}
