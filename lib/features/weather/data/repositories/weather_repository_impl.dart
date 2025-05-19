import 'package:rijal_driweather/features/weather/data/models/forecast_hourly_model.dart';
import 'package:rijal_driweather/features/weather/domain/entities/forecast_daily_entity.dart';
import 'package:rijal_driweather/features/weather/domain/entities/forecast_hourly_entity.dart';
import 'package:rijal_driweather/features/weather/domain/entities/weather_entity.dart';
import 'package:rijal_driweather/features/weather/domain/repositories/weather_repository.dart';

import '../datasources/weather_remote_datasource.dart';
import '../models/forecast_daily_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource remoteDatasource;

  WeatherRepositoryImpl(this.remoteDatasource);

  @override
  Future<WeatherEntity> getWeather(String location) async {
    final weatherModel = await remoteDatasource.getWeather(location);
    return weatherModel.toEntity();
  }

  @override
  Future<List<ForecastHourlyEntity>> getForecastHourly(String location) async {
    final List<ForecastHourlyModel> data =
        await remoteDatasource.getForecastHourly(location);
    return data
        .map((forecast) => ForecastHourlyEntity(
              time: forecast.time,
              temperature: forecast.temperature,
            ))
        .toList();
  }

  @override
  Future<List<ForecastDailyEntity>> getForecastDaily(String location) async {
    final List<ForecastDailyModel> data =
        await remoteDatasource.getForecastDaily(location);
    return data
        .map((forecast) => ForecastDailyEntity(
              time: forecast.time,
              temperatureAvg: forecast.temperatureAvg,
            ))
        .toList();
  }
}
