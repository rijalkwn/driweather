import 'package:rijal_driweather/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:rijal_driweather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:rijal_driweather/features/weather/domain/repositories/weather_repository.dart';
import 'package:rijal_driweather/features/weather/domain/usecases/get_weather_usecase.dart';

import 'features/weather/domain/usecases/get_forecast_daily_usecase.dart';
import 'features/weather/domain/usecases/get_forecast_hourly.usecase.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //bloc
  locator.registerFactory(() => WeatherBloc(locator(), locator(), locator()));

  //usecase
  locator.registerLazySingleton(() => GetWeatherUsecase(locator()));
  locator.registerLazySingleton(() => GetForecastHourlyUsecase(locator()));
  locator.registerLazySingleton(() => GetForecastDailyUsecase(locator()));

  //repository
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(locator()));

  //datasource
  locator.registerLazySingleton<WeatherRemoteDatasource>(
      () => WeatherRemoteDatasource());
}
