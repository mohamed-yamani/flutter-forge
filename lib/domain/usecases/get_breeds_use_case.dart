import 'package:dartz/dartz.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/entities/no_params.dart';
import 'package:flutterforge/domain/repositories/forge_repository.dart';
import 'package:flutterforge/domain/usecases/usecase.dart';

class GetBreedsUseCase extends UseCase<List<BreedsData>, NoParams> {
  final ForgeRepository repository;

  GetBreedsUseCase(this.repository);

  @override
  Future<Either<AppError, List<BreedsData>>> call(NoParams params) async {
    return await repository.getBreeds();
  }
}
