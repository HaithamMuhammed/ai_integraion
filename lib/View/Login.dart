// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ai_project/View/Widgets/AuthTextField.dart';
import 'package:new_ai_project/View/Widgets/Custombutton.dart';


class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B3D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 32)),
            Text('CREATE AN ACCOUNT TO MAKE SDFSDF',
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 40),
            AuthTextField(controller: emailController, hint: 'Email'),
            SizedBox(height: 20),
            AuthTextField(
              controller: passwordController,
              hint: 'Password',
              isPassword: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Forget your password?',
                  style: TextStyle(color: Colors.white70)),
            ),
            SizedBox(height: 30),
            CustomButton(
              text: 'LOGIN',
              filled: true,
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  context.go('/home');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login failed: ${e.toString()}")));
                }
              },
            ),
            TextButton(
              onPressed: () => context.go('/signup'),
              child: Text("DON'T HAVE AN ACCOUNT?",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
