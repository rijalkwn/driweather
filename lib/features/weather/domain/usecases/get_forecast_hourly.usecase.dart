import 'package:rijal_driweather/features/weather/domain/entities/forecast_hourly_entity.dart';

import '../repositories/weather_repository.dart';

class GetForecastHourlyUsecase {
  final WeatherRepository weatherRepository;

  GetForecastHourlyUsecase(this.weatherRepository);

  Future<List<ForecastHourlyEntity>> call(String location) async {
    return await weatherRepository.getForecastHourly(location);
  }
}
