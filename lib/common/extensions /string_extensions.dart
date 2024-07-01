import 'package:flutter/material.dart';
import 'package:flutterforge/presentation/app_localizations.dart';

extension StringExtensions on String {
  String intelliTrim() {
    return length <= 15 ? this : '${substring(0, 15)}...';
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
