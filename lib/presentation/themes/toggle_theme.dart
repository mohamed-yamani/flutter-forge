import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterforge/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutterforge/presentation/themes/app_color.dart';

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({super.key});

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  // ThemeCubit? _themeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topRight,
          // child: IconButton(
          //   onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          //   icon: Icon(Icons.lightbulb,
          //       color: state == Themes.light
          //           ? AppColor.secondaryDark
          //           : AppColor.secondary),
          // ),
          child: Switch(
            value: state == Themes.light ? true : false,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.inactivegrey,
            inactiveThumbColor: AppColors.primary,
            inactiveTrackColor: AppColors.inactivegrey,
          ),
        );
      },
    );
  }
}
