class WeatherEntity {
  final String time;
  final String cloudBase;
  final String cloudCeiling;
  final String cloudCover;
  final String dewPoint;
  final String freezingRainIntensity;
  final int humidity;
  final String precipitationProbability;
  final String pressureSeaLevel;
  final String pressureSurfaceLevel;
  final String rainIntensity;
  final String sleetIntensity;
  final String snowIntensity;
  final double temperature;
  final String temperatureApparent;
  final String uvHealthConcern;
  final String uvIndex;
  final String visibility;
  final int weatherCode;
  final String windDirection;
  final String windGust;
  final double windSpeed;
  final String lat;
  final String lon;
  final String name;
  final String type;

  WeatherEntity({
    required this.time,
    required this.cloudBase,
    required this.cloudCeiling,
    required this.cloudCover,
    required this.dewPoint,
    required this.freezingRainIntensity,
    required this.humidity,
    required this.precipitationProbability,
    required this.pressureSeaLevel,
    required this.pressureSurfaceLevel,
    required this.rainIntensity,
    required this.sleetIntensity,
    required this.snowIntensity,
    required this.temperature,
    required this.temperatureApparent,
    required this.uvHealthConcern,
    required this.uvIndex,
    required this.visibility,
    required this.weatherCode,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
    required this.lat,
    required this.lon,
    required this.name,
    required this.type,
  });
}
