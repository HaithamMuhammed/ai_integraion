// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_ai_project/Controllers/aipredictor_cubit.dart';
import 'package:new_ai_project/Controllers/weather_cubit_cubit.dart';
import 'package:new_ai_project/Routes/Routes.dart';
import 'package:new_ai_project/Services/DioHelper.dart';
import 'package:new_ai_project/Services/weather.Repositrey.dart';
import 'package:new_ai_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WeatherCubitCubit(WeatherRepository())),
        BlocProvider(create: (context) => AIPredictorCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routerConfig: router,
    );
  }
}
