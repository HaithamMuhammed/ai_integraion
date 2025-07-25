// lib/View/widgets/google_nav_bar_widget.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Import GNav package

class GoogleNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const GoogleNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GNav(
        rippleColor: Colors.transparent,
        hoverColor: Colors.transparent,
        gap: 8,
        activeColor: Colors.white,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor:Colors.transparent,
        color: Colors.white54,
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.star,
            text: 'Fav',
          ),
          GButton(
            icon: FontAwesomeIcons.solidUser,
            text: 'Profile',
          ),
          GButton(
            icon: FontAwesomeIcons.house,
            text: 'Home',
          ),
          GButton(
            icon: FontAwesomeIcons.check,
            text: 'Check',
          ),
          GButton(
            icon: FontAwesomeIcons.star,
            text: 'Fav',
          ),
        ],
        selectedIndex: currentIndex, 
        onTabChange: onTabChange, 
      ),
    );
  }
}