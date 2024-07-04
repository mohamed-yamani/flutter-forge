import 'package:dartz/dartz.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, void>> updateTheme(Themes theme);
  Future<Either<AppError, String>> getPreferredTheme();
}
