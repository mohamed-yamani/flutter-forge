import 'package:flutter/material.dart';
import 'package:flutterforge/common/constants/size_constants.dart';
import 'package:flutterforge/common/extensions%20/size_extensions.dart';
import 'package:flutterforge/common/screenutil/screenutil.dart';
import 'package:flutterforge/presentation/widgets/logo.dart';

class ForgeAppBar extends StatelessWidget {
  const ForgeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_8.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const Expanded(
            child: Logo(size: Sizes.dimen_12),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
