import 'package:flutter/material.dart';
import 'package:flutterforge/presentation/journeys/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final Key? key;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final List<String> items;
  const NavigationExpandedListItem(
      {required this.title,
      required this.icon,
      required this.onTap,
      required this.items,
      required this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
              ),
            ],
          ),
          child: ExpansionTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    )),
            children: items
                .map((e) => NavigationSubListItem(
                      title: e,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          )),
    );
  }
}
