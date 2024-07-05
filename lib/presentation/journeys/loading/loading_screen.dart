import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterforge/common/constants/size_constants.dart';
import 'package:flutterforge/common/extensions%20/size_extensions.dart';
import 'package:flutterforge/presentation/blocs/loading_bloc/loading_bloc.dart';
import 'package:flutterforge/presentation/journeys/loading/loading_circle.dart';
import 'package:flutterforge/presentation/themes/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  const LoadingScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            if (state is LoadingStarted)
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                ),
                child: Center(
                  child: LoadingCircle(
                    size: Sizes.dimen_200.w,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
