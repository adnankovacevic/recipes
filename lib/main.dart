import 'package:flutter/material.dart';
import 'package:recipes/themes/theme.dart';
import 'package:recipes/views/root/root_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: RootView(),
    );
  }
}
