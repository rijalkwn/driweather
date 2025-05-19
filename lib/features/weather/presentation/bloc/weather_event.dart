abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String location;

  GetWeatherEvent(this.location);
}

class GetForecastHourlyEvent extends WeatherEvent {
  final String location;

  GetForecastHourlyEvent(this.location);
}

class GetForecastDailyEvent extends WeatherEvent {
  final String location;

  GetForecastDailyEvent(this.location);
}
