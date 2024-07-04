import 'package:dartz/dartz.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/repositories/app_repository.dart';
import 'package:flutterforge/domain/usecases/usecase.dart';

class GetPreferredLanguageUseCase extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguageUseCase({required this.appRepository});

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
