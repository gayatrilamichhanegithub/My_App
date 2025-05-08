import 'package:flutter/material.dart';
import 'package:my_project/icecream/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: IcecreamView()));
  }
}
