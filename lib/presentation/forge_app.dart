import 'package:flutter/material.dart';
import 'package:flutterforge/common/screenutil/screenutil.dart';
import 'package:flutterforge/presentation/home_screen.dart';
import 'package:flutterforge/presentation/themes/app_color.dart';
import 'package:flutterforge/presentation/themes/theme_text.dart';

class ForgeApp extends StatelessWidget {
  const ForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
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
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColors.primary, elevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}
