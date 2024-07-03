import 'package:flutterforge/data/data_sources/theme_locale_data_source.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/repositories/app_repository.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';
import 'package:dartz/dartz.dart';

class AppRepositoryImpl extends AppRepository {
  final ThemeLocaleDataSource themeLocaleDataSource;

  AppRepositoryImpl({required this.themeLocaleDataSource});

  @override
  Future<Either<AppError, String>> getPreferredTheme() async {
    try {
      final theme = await themeLocaleDataSource.getPreferredTheme();
      if (theme == null) {
        return const Left(AppError(AppErrorType.cache));
      }
      return Right(theme);
    } on Exception {
      return const Left(AppError(AppErrorType.cache));
    }
  }

  @override
  Future<Either<AppError, void>> updateTheme(Themes theme) async {
    try {
      await themeLocaleDataSource.updateTheme(theme);
      return const Right(null);
    } on Exception {
      return const Left(AppError(AppErrorType.cache));
    }
  }
}
