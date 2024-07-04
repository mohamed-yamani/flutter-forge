import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/route_constants.dart';
import 'package:flutterforge/common/constants/translation_constants.dart';
import 'package:flutterforge/common/extensions%20/string_extensions.dart';
import 'package:flutterforge/presentation/journeys/details/details_screen.dart';
import 'package:flutterforge/presentation/themes/toggle_theme.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TranslationConstants.homePage.t(context),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          const ToggleTheme(),
          // navigatin button to the next screen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.settings);
            },
            child: Text(
              TranslationConstants.settings.t(context),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.settings);
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
          ),
          // DetailsScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.details,
                  arguments: const DetailsArguments(
                    title: 'Title 1',
                    message: 'Messa ge',
                  ));
            },
            child: Text(
              TranslationConstants.details.t(context),
            ),
          ),
        ],
      ),
    );
  }
}
