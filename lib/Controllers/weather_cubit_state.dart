part of 'weather_cubit_cubit.dart';

@immutable
abstract class WeatherCubitState {}

class WeatherCubitInitial extends WeatherCubitState {}

class WeatherLoading extends WeatherCubitState {}

class WeatherSuccess extends WeatherCubitState {
  final WeatherModel weather;

  WeatherSuccess(this.weather);
}

class WeatherError extends WeatherCubitState {
  final String message;

  WeatherError(this.message);
}
