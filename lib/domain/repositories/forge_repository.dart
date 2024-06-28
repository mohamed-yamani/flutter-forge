import 'package:dartz/dartz.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';

abstract class ForgeRepository {
  Future<Either<AppError, List<BreedsData>>> getBreeds();
}
