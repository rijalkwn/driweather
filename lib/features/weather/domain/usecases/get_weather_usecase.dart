import 'package:rijal_driweather/features/weather/domain/entities/weather_entity.dart';

import '../repositories/weather_repository.dart';

class GetWeatherUsecase {
  final WeatherRepository weatherRepository;

  GetWeatherUsecase(this.weatherRepository);

  Future<WeatherEntity> call(String location) async {
    return await weatherRepository.getWeather(location);
  }
}
