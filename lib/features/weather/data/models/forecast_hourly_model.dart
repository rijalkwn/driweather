class ForecastHourlyModel {
  final String time;
  final double temperature;

  ForecastHourlyModel({
    required this.time,
    required this.temperature,
  });
  factory ForecastHourlyModel.fromJson(Map<String, dynamic> json) {
    final values = json['values'];

    return ForecastHourlyModel(
      time: json['time'] as String,
      temperature: values['temperature'] as double,
    );
  }

  // mapping dari model ke entity
  ForecastHourlyModel toEntity() {
    return ForecastHourlyModel(
      time: time,
      temperature: temperature,
    );
  }
}
