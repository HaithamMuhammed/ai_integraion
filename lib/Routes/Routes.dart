// ignore_for_file: file_names

import 'package:go_router/go_router.dart';
import 'package:new_ai_project/View/HomeScreen.dart';
import 'package:new_ai_project/View/LandingScreen.dart';
import 'package:new_ai_project/View/Login.dart';
import 'package:new_ai_project/View/SignUp.dart';


final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => LandingScreen()),
    GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
    GoRoute(path: '/signup', builder: (_, __) => SignupScreen()),
    GoRoute(path: '/home', builder: (_, __) => HomeScreen()),
    
  ],
);
