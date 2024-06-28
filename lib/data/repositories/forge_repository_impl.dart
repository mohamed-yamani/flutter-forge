import 'package:dartz/dartz.dart';
import 'package:flutterforge/data/data_sources/remote_data_source.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';
import 'package:flutterforge/domain/repositories/forge_repository.dart';

class ForgeRepositoryImpl extends ForgeRepository {
  final RemoteDataSource remoteDataSource;

  ForgeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<BreedsData>>> getBreeds() async {
    try {
      // return await remoteDataSource.getResults();
      try {
        final breeds = await remoteDataSource.getBreeds();
        return breeds;
      } catch (e) {
        return Left(
            AppError(message: e.toString().replaceAll('Exception: ', '')));
      }
    } catch (e) {
      rethrow;
    }
  }
}
