import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:walktron/views/views.dart';

class HomeView extends StatelessWidget {
  final tab = [
    AddDevicesView(),
    DashboardView(),
    ActivityView(),
    const Center(
      child: Icon(Icons.face, size: 30),
    ),
    // Center(
    //   child: RaisedButton(onPressed: () {
    //     AuthController.to.logout();
    //   }),
    // ),
    // ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return ValueBuilder(
      initialValue: 1,
      builder: (snapshot, void Function(dynamic) updater) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: tab[snapshot as int],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          height: 50.0,
          backgroundColor: Colors.pinkAccent,
          animationDuration: const Duration(milliseconds: 350),
          // key: _bottomNavigationKey,
          items: const <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.home, size: 30),
            Icon(FontAwesomeIcons.ankh, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) => updater(index),
        ),
      ),
    );
  }
}
