import '../../domain/entities/weather_entity.dart';

class WeatherModel {
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

  WeatherModel({
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      time: json['data']['time'] as String,
      cloudBase: json['data']['values']['cloudBase'].toString(),
      cloudCeiling: json['data']['values']['cloudCeiling'].toString(),
      cloudCover: json['data']['values']['cloudCover'].toString(),
      dewPoint: json['data']['values']['dewPoint'].toString(),
      freezingRainIntensity:
          json['data']['values']['freezingRainIntensity'].toString(),
      humidity: json['data']['values']['humidity'] as int,
      precipitationProbability:
          json['data']['values']['precipitationProbability'].toString(),
      pressureSeaLevel: json['data']['values']['pressureSeaLevel'].toString(),
      pressureSurfaceLevel:
          json['data']['values']['pressureSurfaceLevel'].toString(),
      rainIntensity: json['data']['values']['rainIntensity'].toString(),
      sleetIntensity: json['data']['values']['sleetIntensity'].toString(),
      snowIntensity: json['data']['values']['snowIntensity'].toString(),
      temperature: json['data']['values']['temperature'] as double,
      temperatureApparent:
          json['data']['values']['temperatureApparent'].toString(),
      uvHealthConcern: json['data']['values']['uvHealthConcern'].toString(),
      uvIndex: json['data']['values']['uvIndex'].toString(),
      visibility: json['data']['values']['visibility'].toString(),
      weatherCode: json['data']['values']['weatherCode'] as int,
      windDirection: json['data']['values']['windDirection'].toString(),
      windGust: json['data']['values']['windGust'].toString(),
      windSpeed: json['data']['values']['windSpeed'] as double,
      lat: json['location']["lat"].toString(),
      lon: json['location']["lon"].toString(),
      name: json['location']["name"].toString(),
      type: json['location']["type"].toString(),
    );
  }

  // mapping dari model ke entity
  WeatherEntity toEntity() {
    return WeatherEntity(
      time: time,
      cloudBase: cloudBase,
      cloudCeiling: cloudCeiling,
      cloudCover: cloudCover,
      dewPoint: dewPoint,
      freezingRainIntensity: freezingRainIntensity,
      humidity: humidity,
      precipitationProbability: precipitationProbability,
      pressureSeaLevel: pressureSeaLevel,
      pressureSurfaceLevel: pressureSurfaceLevel,
      rainIntensity: rainIntensity,
      sleetIntensity: sleetIntensity,
      snowIntensity: snowIntensity,
      temperature: temperature,
      temperatureApparent: temperatureApparent,
      uvHealthConcern: uvHealthConcern,
      uvIndex: uvIndex,
      visibility: visibility,
      weatherCode: weatherCode,
      windDirection: windDirection,
      windGust: windGust,
      windSpeed: windSpeed,
      lat: lat,
      lon: lon,
      name: name,
      type: type,
    );
  }
}
