import 'package:flutter/material.dart';
import 'package:my_project/views/home_view.dart';

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter Learn", home: HomeView());
  }
}
