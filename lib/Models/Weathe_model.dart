// Models/weather_model.dart

class WeatherModel {
  final String cityName;
  final double currentTemp;
  final String currentCondition;
  final String currentIcon;
  final List<DailyForecast> forecast;

  WeatherModel({
    required this.cityName,
    required this.currentTemp,
    required this.currentCondition,
    required this.currentIcon,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final List forecastData = json['forecast']['forecastday'];
    List<DailyForecast> forecast = forecastData.map((day) {
      return DailyForecast.fromJson(day);
    }).toList();

    return WeatherModel(
      cityName: json['location']['name'],
      currentTemp: json['current']['temp_c'].toDouble(),
      currentCondition: json['current']['condition']['text'],
      currentIcon: json['current']['condition']['icon'],
      forecast: forecast,
    );
  }
}

class DailyForecast {
  final String date;
  final double avgTemp;
  final String condition;
  final String icon;

  DailyForecast({
    required this.date,
    required this.avgTemp,
    required this.condition,
    required this.icon,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['date'],
      avgTemp: json['day']['avgtemp_c'].toDouble(),
      condition: json['day']['condition']['text'],
      icon: json['day']['condition']['icon'],
    );
  }
}
