// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_ai_project/Models/Weathe_model.dart';
import 'package:new_ai_project/Services/weather.Repositrey.dart';

part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  final WeatherRepository repository;
  WeatherCubitCubit(this.repository) : super(WeatherCubitInitial());

  void getForecastweather(String city) async {
    emit(WeatherLoading());

    try {
      final weather = await repository.fetchForecastWeather(city);
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
