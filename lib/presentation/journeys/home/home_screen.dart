import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/translation_constants.dart';
import 'package:flutterforge/common/extensions%20/string_extensions.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:flutterforge/presentation/journeys/drawer/my_navigation_drawer.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Flutter Forge",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).backgroundColor,
                ),
          ),

          // open drawer
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: const MyNavigationDrawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TranslationConstants.homePage.t(context),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                      )),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              const ToggleTheme(),
            ],
          ),
        ));
  }
}
