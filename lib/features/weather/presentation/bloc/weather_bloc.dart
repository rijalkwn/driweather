import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijal_driweather/features/weather/domain/usecases/get_forecast_daily_usecase.dart';
import 'package:rijal_driweather/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:rijal_driweather/features/weather/presentation/bloc/weather_event.dart';
import 'package:rijal_driweather/features/weather/presentation/bloc/weather_state.dart';

import '../../domain/entities/forecast_daily_entity.dart';
import '../../domain/entities/forecast_hourly_entity.dart';
import '../../domain/usecases/get_forecast_hourly.usecase.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUsecase getWeatherUsecase;
  final GetForecastHourlyUsecase getForecastHourlyUsecase;
  final GetForecastDailyUsecase getForecastDailyUsecase;

  List<ForecastHourlyEntity> forecastHourly = [];
  List<ForecastDailyEntity> forecastDaily = [];

  WeatherBloc(
    this.getWeatherUsecase,
    this.getForecastHourlyUsecase,
    this.getForecastDailyUsecase,
  ) : super(WeatherInitialState()) {
    on<GetWeatherEvent>(_onGetWeather);
    on<GetForecastHourlyEvent>(_onGetForecastHourly);
    on<GetForecastDailyEvent>(_onGetForecastDaily);
  }

  void _onGetWeather(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final weather = await getWeatherUsecase(event.location);
      emit(WeatherLoadedState(weather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

  void _onGetForecastHourly(
      GetForecastHourlyEvent event, Emitter<WeatherState> emit) async {
    try {
      // Tidak emit loading state di sini supaya UI tidak reload terus
      final List<ForecastHourlyEntity> forecast =
          await getForecastHourlyUsecase(event.location);
      forecastHourly = forecast;

      // Emit state dengan kedua data, daily tetap dari property yg ada
      emit(ForecastLoadedState(
        forecastHourly: forecastHourly,
        forecastDaily: forecastDaily,
      ));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

  void _onGetForecastDaily(
      GetForecastDailyEvent event, Emitter<WeatherState> emit) async {
    try {
      final List<ForecastDailyEntity> forecast =
          await getForecastDailyUsecase(event.location);
      forecastDaily = forecast;

      // Emit state dengan kedua data, hourly tetap dari property yg ada
      emit(ForecastLoadedState(
        forecastHourly: forecastHourly,
        forecastDaily: forecastDaily,
      ));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
