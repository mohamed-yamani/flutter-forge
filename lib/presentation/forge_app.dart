import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/common/screenutil/screenutil.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/app_localizations.dart';
import 'package:flutterforge/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:flutterforge/presentation/journeys/home/home_screen.dart';
import 'package:flutterforge/presentation/themes/app_color.dart';
import 'package:flutterforge/presentation/themes/theme_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgeApp extends StatefulWidget {
  const ForgeApp({super.key});

  @override
  State<ForgeApp> createState() => _ForgeAppState();
}

class _ForgeAppState extends State<ForgeApp> {
  LanguageBloc? languageBloc;

  @override
  void initState() {
    super.initState();
    languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    languageBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: languageBloc!,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Flutter Forge",
              theme: ThemeData(
                primaryColor: AppColors.primary,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.purple,
                ),
                scaffoldBackgroundColor: AppColors.backgroundLight,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: ThemeText.getTextTheme(),
                appBarTheme: const AppBarTheme(
                    backgroundColor: AppColors.primary, elevation: 0),
              ),
              supportedLocales: Languages.languages
                  .map((language) => Locale(language.code))
                  .toList(),
              locale: Locale(state.locale.languageCode),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: const HomeScreen(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
