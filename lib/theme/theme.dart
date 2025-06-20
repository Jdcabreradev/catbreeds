import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.black.withValues(alpha: 0.3),
    selectionHandleColor: Colors.black,
    cursorColor: Colors.black,
  ),
);
