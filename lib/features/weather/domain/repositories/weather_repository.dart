import 'package:rijal_driweather/features/weather/domain/entities/forecast_hourly_entity.dart';
import 'package:rijal_driweather/features/weather/domain/entities/weather_entity.dart';

import '../entities/forecast_daily_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String location);
  Future<List<ForecastHourlyEntity>> getForecastHourly(String location);
  Future<List<ForecastDailyEntity>> getForecastDaily(String location);
}
