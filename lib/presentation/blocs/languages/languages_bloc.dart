// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/domain/entities/language_entity.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/usecases/get_preferred_language_use_case.dart';
import 'package:flutterforge/domain/usecases/update_language_use_case.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetPreferredLanguageUseCase getPreferredLanguage;
  final UpdateLanguageUseCase updateLanguage;
  // final LoadingBloc loadingBloc;

  LanguagesBloc({
    required this.getPreferredLanguage,
    required this.updateLanguage,
    // required this.loadingBloc,
  }) : super(LanguageLoadedState(
          Locale(Languages.languages[2].code),
        )) {
    on<ToggleLanguagesEvent>((event, emit) async {
      await updateLanguage(event.language.code);
      emit(LanguageLoadedState(
          Locale(event.language.code, event.language.code)));
    });
    on<LoadPreferredLanguagesEvent>((event, emit) async {
      emit(const LanguageLoadingState());
      final language = await getPreferredLanguage(NoParams());
      language.fold(
        (failure) => emit(LanguageLoadedState(
            Locale(Languages.languages[2].code, Languages.languages[2].code))),
        (language) => emit(LanguageLoadedState(Locale(language, language))),
      );
    });
  }
}
