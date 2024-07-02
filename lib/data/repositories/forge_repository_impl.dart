import 'dart:io';

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
      final breeds = await remoteDataSource.getBreeds();
      return breeds;
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
