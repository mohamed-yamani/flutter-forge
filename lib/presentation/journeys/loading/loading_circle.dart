import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingCircle extends StatelessWidget {
  final double size;
  const LoadingCircle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        'assets/animations/loader.json',
        fit: BoxFit.cover,
        repeat: true,
        frameRate: FrameRate.max,
      ),
    );
  }
}
