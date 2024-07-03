// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/repositories/app_repository.dart';
import 'package:flutterforge/domain/usecases/usecase.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';

class UpdateThemeUseCase extends UseCase<void, Themes> {
  final AppRepository appRepository;

  UpdateThemeUseCase({required this.appRepository});

  @override
  Future<Either<AppError, void>> call(Themes theme) async {
    return await appRepository.updateTheme(theme);
  }
}
