// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ai_project/View/Widgets/Custombutton.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B3D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(200)),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                CustomButton(
                  text: 'Sign In',
                  filled: true,
                  onTap: () => context.go('/signup'),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: 'Log In',
                  filled: false,
                  onTap: () => context.go('/login'),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
