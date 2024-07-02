import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutterforge/data/core/api_client.dart';
import 'package:flutterforge/data/models/result_model.dart';
import 'package:flutterforge/domain/entities/app_error.dart';

abstract class RemoteDataSource {
  Future<Either<AppError, List<BreedsData>>> getBreeds();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Either<AppError, List<BreedsData>>> getBreeds() async {
    final response = await apiClient.get('/breeds');
    final List<dynamic> results = jsonDecode(response)['data'];

    if (results.isNotEmpty) {
      final breeds = results.map((e) => BreedsData.fromJson(e)).toList();
      return Right(breeds);
    } else {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
