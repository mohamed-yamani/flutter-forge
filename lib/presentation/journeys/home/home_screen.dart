import 'package:flutter/material.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:flutterforge/presentation/journeys/drawer/my_navigation_drawer.dart';
import 'package:flutterforge/presentation/journeys/home/home_screen_body.dart';

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
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Flutter Forge",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        drawer: const MyNavigationDrawer(),
        body: const HomeScreenBody());
  }
}
