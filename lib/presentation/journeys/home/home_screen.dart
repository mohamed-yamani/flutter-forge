import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/route_constants.dart';
import 'package:flutterforge/common/constants/translation_constants.dart';
import 'package:flutterforge/common/extensions%20/string_extensions.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:flutterforge/presentation/journeys/details/details_screen.dart';
import 'package:flutterforge/presentation/themes/toggle_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetBreedsBloc? getBreedsBloc;

  @override
  void initState() {
    super.initState();
    getBreedsBloc = getItInstance<GetBreedsBloc>();
    getBreedsBloc!.add(GetBreeds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: MyNavigationDrawer(),
        body: SafeArea(
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
    ));
  }
}
