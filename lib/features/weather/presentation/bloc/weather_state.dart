import 'package:rijal_driweather/features/weather/domain/entities/forecast_hourly_entity.dart';
import 'package:rijal_driweather/features/weather/domain/entities/weather_entity.dart';

import '../../domain/entities/forecast_daily_entity.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weather;
  WeatherLoadedState(this.weather);
}

class ForecastLoadedState extends WeatherState {
  final List<ForecastHourlyEntity> forecastHourly;
  final List<ForecastDailyEntity> forecastDaily;

  ForecastLoadedState({
    this.forecastHourly = const [],
    this.forecastDaily = const [],
  });
}

class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState(this.error);
}
