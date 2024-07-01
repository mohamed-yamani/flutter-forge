import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterforge/di/get_it.dart';
import 'package:flutterforge/domain/entities/language_entity.dart';
import 'package:flutterforge/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:flutterforge/presentation/journeys/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatefulWidget {
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
  State<NavigationExpandedListItem> createState() =>
      _NavigationExpandedListItemState();
}

class _NavigationExpandedListItemState
    extends State<NavigationExpandedListItem> {
  LanguageBloc? languageBloc;

  @override
  void initState() {
    super.initState();
    languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
            leading: Icon(widget.icon, color: Colors.white),
            title: Text(widget.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    )),
            children: [
              for (var i = 0; i < widget.items.length; i++)
                NavigationSubListItem(
                  title: widget.items[i],
                  onTap: () {
                    languageBloc!.add(ToggleLanguagesEvent(LanguageEntity(
                        code: widget.items[i].substring(0, 2).toLowerCase(),
                        value: widget.items[i])));
                    Navigator.pop(context);
                  },
                )
            ],
          )),
    );
  }
}
