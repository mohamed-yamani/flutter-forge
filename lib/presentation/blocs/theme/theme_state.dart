part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoadedState extends ThemeState {
  final Themes themes;

  const ThemeLoadedState(this.themes);

  @override
  List<Object> get props => [themes];
}

class ThemeLoadingState extends ThemeState {}

class ThemeErrorState extends ThemeState {
  final String message;

  const ThemeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
