import 'package:dio/dio.dart';
import 'package:new_ai_project/Models/Weathe_model.dart';

import 'DioHelper.dart';
import 'EndPoints.dart';

class WeatherRepository {
  Future<WeatherModel> fetchForecastWeather(String city) async {
    final Response response = await DioHelper.getData(
      url: FORECAST_WEATHER_ENDPOINT,
      query: {
        'key': WEATHER_API_KEY,
        'q': city,
        'days': 3,
      },
    );

    return WeatherModel.fromJson(response.data);
 }
}