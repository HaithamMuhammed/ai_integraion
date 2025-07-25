// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ai_project/View/Widgets/AuthTextField.dart';
import 'package:new_ai_project/View/Widgets/Custombutton.dart';


class SignupScreen extends StatelessWidget {
  final NameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: 25,
              child: Icon(Icons.check_box, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text("Are You Sure?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Ok", style: TextStyle(color: Colors.lightBlue)),
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1B3D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Text('SIGN UP',
                style: TextStyle(color: Colors.white, fontSize: 32)),
            Text('CREATE AN ACCOUNT TO MAKE SDFSDF',
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 40),
            AuthTextField(controller: NameController, hint: "Full Name"),
            SizedBox(height: 20),
            AuthTextField(controller: emailController, hint: 'Email'),
            SizedBox(height: 20),
            AuthTextField(
              controller: passwordController,
              hint: 'Password',
              isPassword: true,
            ),
            SizedBox(height: 30),
            CustomButton(
              text: 'NEXT',
              filled: true,
              onTap: () {
                _showConfirmationDialog(context, () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    context.go('/login'); // or /home if you want to go directly
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Signup failed: ${e.toString()}")));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
