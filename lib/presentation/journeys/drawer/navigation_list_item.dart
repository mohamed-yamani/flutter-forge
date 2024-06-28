import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final Key? key;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const NavigationListItem(
      {required this.title,
      required this.icon,
      required this.onTap,
      required this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  )),
        ),
      ),
    );
  }
}
