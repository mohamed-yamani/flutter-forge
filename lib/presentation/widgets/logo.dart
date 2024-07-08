import 'package:flutter/material.dart';
import 'package:flutterforge/common/extensions%20/size_extensions.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pngs/logo.png',
      height: size.sp,
    );
  }
}
