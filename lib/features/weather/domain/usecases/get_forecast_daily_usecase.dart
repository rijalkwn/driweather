import '../entities/forecast_daily_entity.dart';
import '../repositories/weather_repository.dart';

class GetForecastDailyUsecase {
  final WeatherRepository weatherRepository;

  GetForecastDailyUsecase(this.weatherRepository);

  Future<List<ForecastDailyEntity>> call(String location) async {
    return await weatherRepository.getForecastDaily(location);
  }
}
