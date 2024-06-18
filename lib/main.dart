import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pencilkit_note_taking/models/draw_model.dart';

import 'views/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
          ),
        ),
        visualDensity: VisualDensity.compact,
      ),
      home: const HomeScreen(),
    );
  }
}
