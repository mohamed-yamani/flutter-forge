import 'package:flutter/material.dart';

class DetailsArguments {
  final String title;
  final String message;

  const DetailsArguments({required this.title, required this.message});
}

class DetailsScreen extends StatelessWidget {
  final DetailsArguments arguments;

  const DetailsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(arguments.message),
        ),
      ),
    );
  }
}
