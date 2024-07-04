import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/route_constants.dart';
import 'package:flutterforge/presentation/journeys/details/details_screen.dart';
import 'package:flutterforge/presentation/journeys/home/home_screen.dart';
import 'package:flutterforge/presentation/journeys/settings/settings_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.home: (context) => const HomeScreen(),
        RouteList.settings: (context) => const SettingsScreen(),
        RouteList.details: (context) => DetailsScreen(
              arguments: settings.arguments as DetailsArguments,
            ),
      };
}
