import 'dart:convert';

import '../models/forecast_daily_model.dart';
import '../models/forecast_hourly_model.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteDatasource {
  Future<WeatherModel> getWeather(String location) async {
    final response = await http.get(Uri.parse(
        'https://api.tomorrow.io/v4/weather/realtime?location=$location&apikey=DSD2kGlbcMGdapSF4c6uXwFyJLcAaHkx'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<ForecastHourlyModel>> getForecastHourly(String location) async {
    final response = await http.get(Uri.parse(
        'https://api.tomorrow.io/v4/weather/forecast?location=$location&apikey=DSD2kGlbcMGdapSF4c6uXwFyJLcAaHkx'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = json.decode(response.body);
      final List<dynamic> data = jsonBody['timelines']['hourly'];
      return data
          .map((item) =>
              ForecastHourlyModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<ForecastDailyModel>> getForecastDaily(String location) async {
    final response = await http.get(Uri.parse(
        'https://api.tomorrow.io/v4/weather/forecast?location=$location&apikey=DSD2kGlbcMGdapSF4c6uXwFyJLcAaHkx'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = json.decode(response.body);
      final List<dynamic> data = jsonBody['timelines']['daily'];
      return data
          .map((item) =>
              ForecastDailyModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
