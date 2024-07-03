import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/usecases/get_preferred_theme_use_case.dart';
import 'package:flutterforge/domain/usecases/update_theme_use_case.dart';

part 'theme_state.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  final GetPreferredThemeUseCase getPreferredTheme;
  final UpdateThemeUseCase updateTheme;

  ThemeCubit({
    required this.getPreferredTheme,
    required this.updateTheme,
  }) : super(Themes.dark);

  Future<void> toggleTheme() async {
    await updateTheme(state == Themes.dark ? Themes.light : Themes.dark);
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final result = await getPreferredTheme(NoParams());
    result.fold(
      (failure) => emit(Themes.dark),
      (theme) => emit(theme == 'light' ? Themes.light : Themes.dark),
    );
  }
}
