import 'package:flutterforge/data/core/api_client.dart';
import 'package:flutterforge/data/data_sources/remote_data_source.dart';
import 'package:flutterforge/data/repositories/forge_repository_impl.dart';
import 'package:flutterforge/domain/repositories/forge_repository.dart';
import 'package:flutterforge/domain/usecases/get_breeds_use_case.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(
      () => ApiClient(client: getItInstance()));

  getItInstance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(apiClient: getItInstance()));

  getItInstance.registerLazySingleton<ForgeRepository>(
      () => ForgeRepositoryImpl(remoteDataSource: getItInstance()));

  getItInstance.registerLazySingleton<GetBreedsUseCase>(
      () => GetBreedsUseCase(getItInstance()));

  getItInstance.registerSingleton<GetBreedsBloc>(GetBreedsBloc(
    getBreedsUseCase: getItInstance(),
  ));
}
