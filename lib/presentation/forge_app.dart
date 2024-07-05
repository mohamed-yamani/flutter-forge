import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/common/constants/route_constants.dart';
import 'package:flutterforge/common/screenutil/screenutil.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/app_localizations.dart';
import 'package:flutterforge/presentation/blocs/languages/languages_bloc.dart';
import 'package:flutterforge/presentation/blocs/loading_bloc/loading_bloc.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutterforge/presentation/fade_page_route_builder.dart';
import 'package:flutterforge/presentation/journeys/loading/loading_screen.dart';
import 'package:flutterforge/presentation/routes.dart';
import 'package:flutterforge/presentation/themes/app_color.dart';
import 'package:flutterforge/presentation/themes/theme_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgeApp extends StatefulWidget {
  const ForgeApp({super.key});

  @override
  State<ForgeApp> createState() => _ForgeAppState();
}

class _ForgeAppState extends State<ForgeApp> {
  LanguagesBloc? languageBloc;
  ThemeCubit? _themeCubit;
  LoadingBloc? loadingBloc;

  @override
  void initState() {
    super.initState();
    loadingBloc = getItInstance<LoadingBloc>();
    languageBloc = getItInstance<LanguagesBloc>();
    languageBloc!.add(LoadPreferredLanguagesEvent());
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit!.loadPreferredTheme();
  }

  @override
  void dispose() {
    loadingBloc!.close();
    languageBloc!.close();
    _themeCubit!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguagesBloc>.value(
          value: languageBloc!,
        ),
        BlocProvider.value(
          value: _themeCubit!,
        ),
        BlocProvider.value(
          value: loadingBloc!,
        ),
      ],
      child: BlocBuilder<LanguagesBloc, LanguagesState>(
        builder: (context, languageState) {
          if (languageState is LanguageLoadedState) {
            return BlocBuilder<ThemeCubit, Themes>(
              builder: (context, themesState) {
                print("themesState: $themesState");
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Flutter Forge",
                  theme: ThemeData(
                    primaryColor: themesState == Themes.dark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.purple,
                      backgroundColor: themesState == Themes.dark
                          ? AppColors.dark
                          : AppColors.light,
                    ),
                    scaffoldBackgroundColor: themesState == Themes.dark
                        ? AppColors.dark
                        : AppColors.light,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: const AppBarTheme(
                        backgroundColor: AppColors.primary, elevation: 0),
                  ),
                  supportedLocales: Languages.languages
                      .map((language) => Locale(language.code))
                      .toList(),
                  locale: Locale(languageState.locale.languageCode),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    AppLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    DefaultMaterialLocalizations.delegate,
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (final supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale!.languageCode &&
                          supportedLocale.countryCode == locale.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  // home: const HomeScreen(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: LoadingScreen(
                        child: child!,
                      ),
                    );
                  },
                  initialRoute: RouteList.home,
                  onGenerateRoute: (settings) {
                    final routes = Routes.getRoutes(settings);
                    final WidgetBuilder? builder = routes[settings.name];
                    return FadePageRouteBuilder(
                      builder: builder!,
                      settings: settings,
                    );
                  },
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
