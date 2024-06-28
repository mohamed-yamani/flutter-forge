import 'package:flutter/material.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/presentation/blocs/get_breeds_bloc/get_breeds_bloc.dart';
import 'package:flutterforge/presentation/journeys/drawer/my_navigation_drawer.dart';

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
          title: const Text("Flutter Forge"),

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
          child: Text("Home Screen",
              style: Theme.of(context).textTheme.headlineLarge),
        ));
  }
}
