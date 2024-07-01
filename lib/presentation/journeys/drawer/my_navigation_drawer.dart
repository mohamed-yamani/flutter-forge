import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/languages.dart';
import 'package:flutterforge/common/constants/size_constants.dart';
import 'package:flutterforge/common/extensions%20/size_extensions.dart';
import 'package:flutterforge/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:flutterforge/presentation/journeys/drawer/navigation_list_item.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_320.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            NavigationListItem(
              key: const Key("HOME"),
              title: "Home",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            NavigationListItem(
              key: const Key("FAVORITES"),
              title: "Favorites",
              icon: Icons.favorite,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            NavigationListItem(
              key: const Key("SETTINGS"),
              title: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            NavigationExpandedListItem(
              key: const Key("EXPANDED"),
              title: "Expanded",
              icon: Icons.expand_more,
              onTap: () {
                Navigator.pop(context);
              },
              items: Languages.languages.map((e) => e.value).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
