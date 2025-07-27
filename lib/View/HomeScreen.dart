// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ai_project/Controllers/aipredictor_cubit.dart';
import 'package:new_ai_project/Controllers/weather_cubit_cubit.dart';
import 'package:new_ai_project/Models/Weathe_model.dart';
import 'package:new_ai_project/Services/weather.Repositrey.dart';
import 'package:new_ai_project/View/CheckScreen.dart';
import 'package:new_ai_project/View/FavScreen.dart';
import 'package:new_ai_project/View/ProfileScreen.dart';
import 'package:new_ai_project/View/Widgets/CustomAppbar.dart';
import 'package:new_ai_project/View/Widgets/DailyData.dart';
import 'package:new_ai_project/View/Widgets/DateSelector.dart';
import 'package:new_ai_project/View/Widgets/DetailsForCard.dart';
import 'package:new_ai_project/View/Widgets/Gnav.dart';
import 'package:new_ai_project/View/Widgets/Graph.dart';
import 'package:new_ai_project/View/Widgets/Steps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDayIndex = 4;
  int _selectedNavBarIndex = 2;
  late PageController _pageController;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedNavBarIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  List<int> convertWeatherToFeatures(WeatherModel weather) {
    int outlookRainy =
        weather.currentCondition.toLowerCase().contains('rain') ? 1 : 0;
    int outlookSunny =
        weather.currentCondition.toLowerCase().contains('sun') ? 1 : 0;
    int tempHot = weather.currentTemp >= 30 ? 1 : 0;
    int tempMild =
        (weather.currentTemp >= 20 && weather.currentTemp < 30) ? 1 : 0;
    int humidityNormal = 1;
    return [outlookRainy, outlookSunny, tempHot, tempMild, humidityNormal];
  }

  Widget _buildHomeTabContent(Map<String, dynamic> currentDayData) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<AIPredictorCubit, AIPredictorState>(
      listener: (context, state) {
        if (state is AIPredictorLoaded) {
          print('AI prediction received: ${state.prediction}');
          final result = state.prediction == 1
              ? ' Will Play Tennis'
              : ' Will NOT Play Tennis';
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFF1A2A54),
              title: const Text('AI Prediction',
                  style: TextStyle(color: Colors.white)),
              content:
                  Text(result, style: const TextStyle(color: Colors.white)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK',
                      style: TextStyle(color: Colors.blueAccent)),
                ),
              ],
            ),
          );
        } else if (state is AIPredictorError) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('AI Error'),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<WeatherCubitCubit, WeatherCubitState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.015),
                  TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search for a city...",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: screenWidth * 0.04,
                      ),
                      prefixIcon: Icon(Icons.search,
                          color: Colors.white70, size: screenWidth * 0.06),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search,
                            color: Colors.white70, size: screenWidth * 0.06),
                        onPressed: () async {
                          final city = _controller.text.trim();
                          if (city.isNotEmpty) {
                            context
                                .read<WeatherCubitCubit>()
                                .getForecastweather(city);

                            final repo = WeatherRepository();
                            final weather =
                                await repo.fetchForecastWeather(city);
                            final features = convertWeatherToFeatures(weather);
                            context
                                .read<AIPredictorCubit>()
                                .predictTennis(features);
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      fillColor: const Color(0xFF1A2A54),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  if (state is WeatherLoading) ...[
                    const CircularProgressIndicator(),
                  ] else if (state is WeatherSuccess) ...[
                    Text(
                      state.weather.cityName,
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.05),
                    ),
                    Text(
                      "${state.weather.currentTemp}°C",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.1),
                    ),
                  ] else if (state is WeatherError) ...[
                    Text(
                      'Error: ${state.message}',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: screenWidth * 0.045),
                    ),
                  ] else ...[
                    Text(
                      "Search for a city to see weather",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.045),
                    ),
                  ],
                  SizedBox(height: screenHeight * 0.025),
                  DateSelectorWidget(
                    selectedDayIndex: _selectedDayIndex,
                    onDaySelected: (index) {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  StepsTrackerWidget(steps: currentDayData['steps']),
                  SizedBox(height: screenHeight * 0.03),
                  MetricCardsWidget(
                    km: currentDayData['km'],
                    heartRate: currentDayData['heartRate'],
                    cal: currentDayData['cal'],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GraphWidget(graphPoints: currentDayData['graphPoints']),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDayData = dailyData[_selectedDayIndex]!;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1B3D),
      appBar: CustomAppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedNavBarIndex = index;
          });
        },
        children: [
          FavScreen(),
          ProfileScreen(),
          _buildHomeTabContent(currentDayData),
          CheckScreen(),
          FavScreen(),
        ],
      ),
      bottomNavigationBar: GoogleNavBarWidget(
        currentIndex: _selectedNavBarIndex,
        onTabChange: (index) {
          setState(() {
            _selectedNavBarIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
