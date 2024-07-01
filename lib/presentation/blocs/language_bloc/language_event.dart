part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguage extends LanguageEvent {
  final LanguageEntity language;

  const ToggleLanguage({required this.language});

  @override
  List<Object> get props => [language.code];
}
