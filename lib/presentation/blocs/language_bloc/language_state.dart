part of 'language_bloc.dart';

abstract class LanguagesState extends Equatable {
  const LanguagesState();

  @override
  List<Object> get props => [];
}

class LanguageLoadedState extends LanguagesState {
  final Locale locale;

  const LanguageLoadedState(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageLoadingState extends LanguagesState {
  const LanguageLoadingState();

  @override
  List<Object> get props => [];
}
