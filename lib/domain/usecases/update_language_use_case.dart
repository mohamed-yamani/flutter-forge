// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/repositories/app_repository.dart';
import 'package:flutterforge/domain/usecases/usecase.dart';

class UpdateLanguageUseCase extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateLanguageUseCase({required this.appRepository});

  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}
