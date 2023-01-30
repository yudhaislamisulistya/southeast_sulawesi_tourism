// ignore_for_file: depend_on_referenced_packages

import 'package:bella_app/constants.dart';
import 'package:bella_app/screens/about.dart';
import 'package:bella_app/screens/dashboard.dart';
import 'package:bella_app/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const <Widget>[
          Dashboard(),
          Maps(),
          About(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        flat: true,
        items: const [
          RollingBottomBarItem(
            Icons.home,
            label: 'Dashboard',
            activeColor: colorPrimary,
          ),
          RollingBottomBarItem(
            Icons.map,
            label: 'Map',
            activeColor: colorPrimary,
          ),
          RollingBottomBarItem(
            Icons.help,
            label: 'About',
            activeColor: colorPrimary,
          ),
        ],
        activeItemColor: Colors.green.shade700,
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
