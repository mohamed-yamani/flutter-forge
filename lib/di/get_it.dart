import 'package:flutterforge/data/core/api_client.dart';
import 'package:flutterforge/data/data_sources/language_locale_data_source.dart';
import 'package:flutterforge/data/data_sources/remote_data_source.dart';
import 'package:flutterforge/data/data_sources/theme_locale_data_source.dart';
import 'package:flutterforge/data/repositories/app_repository_impl.dart';
import 'package:flutterforge/data/repositories/forge_repository_impl.dart';
import 'package:flutterforge/domain/repositories/app_repository.dart';
import 'package:flutterforge/domain/repositories/forge_repository.dart';
import 'package:flutterforge/domain/usecases/get_breeds_use_case.dart';
import 'package:flutterforge/domain/usecases/get_preferred_language_use_case.dart';
import 'package:flutterforge/domain/usecases/get_preferred_theme_use_case.dart';
import 'package:flutterforge/domain/usecases/update_language_use_case.dart';
import 'package:flutterforge/domain/usecases/update_theme_use_case.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:flutterforge/presentation/blocs/languages/languages_bloc.dart';
import 'package:flutterforge/presentation/blocs/loading_bloc/loading_bloc.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';
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

  // LoadingBloc
  getItInstance.registerSingleton<LoadingBloc>(LoadingBloc());

  getItInstance.registerSingleton<GetBreedsBloc>(GetBreedsBloc(
    loadingBloc: getItInstance(),
    getBreedsUseCase: getItInstance(),
  ));

  // themeLocaleDataSource
  getItInstance.registerLazySingleton<ThemeLocaleDataSource>(
      () => ThemeLocaleDataSourceImpl());

  // LanguageLocaleDataSource
  getItInstance.registerLazySingleton<LanguageLocaleDataSource>(
      () => LanguageLocaleDataSourceImpl());

  // AppRepository
  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        themeLocaleDataSource: getItInstance<ThemeLocaleDataSource>(),
        languageLocaleDataSource: getItInstance<LanguageLocaleDataSource>(),
      ));

  // getPreferredTheme
  getItInstance.registerLazySingleton<GetPreferredThemeUseCase>(
      () => GetPreferredThemeUseCase(appRepository: getItInstance()));

  //updateTheme
  getItInstance.registerLazySingleton<UpdateThemeUseCase>(
      () => UpdateThemeUseCase(appRepository: getItInstance()));

  // ThemeCubit
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));

  // GetPreferredLanguageUseCase
  getItInstance.registerLazySingleton<GetPreferredLanguageUseCase>(
      () => GetPreferredLanguageUseCase(appRepository: getItInstance()));

  // UpdateLanguageUseCase
  getItInstance.registerLazySingleton<UpdateLanguageUseCase>(
      () => UpdateLanguageUseCase(appRepository: getItInstance()));

  // LanguagesBloc
  getItInstance.registerSingleton<LanguagesBloc>(LanguagesBloc(
    getPreferredLanguage: getItInstance<GetPreferredLanguageUseCase>(),
    updateLanguage: getItInstance<UpdateLanguageUseCase>(),
  ));
}
