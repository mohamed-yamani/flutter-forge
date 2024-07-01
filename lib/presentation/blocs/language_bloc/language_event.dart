part of 'language_bloc.dart';

abstract class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguagesEvent extends LanguagesEvent {
  final LanguageEntity language;

  const ToggleLanguagesEvent(this.language);

  @override
  List<Object> get props => [language.code];
}

class LoadPreferredLanguagesEvent extends LanguagesEvent {}
