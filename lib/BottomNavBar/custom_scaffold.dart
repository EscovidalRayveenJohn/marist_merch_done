import 'package:flutter/material.dart';
import 'package:maristcommerce/BottomNavBar/bottom_nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showBottomNavBar;
  final int initalIndex;
  const CustomScaffold(
      {super.key,
      required this.body,
      this.showBottomNavBar = false,
      this.initalIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar:
          showBottomNavBar ? BottomNavBar(initialIndex: initalIndex) : null,
    );
  }
}
