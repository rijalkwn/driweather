class ForecastDailyModel {
  final String time;
  final double temperatureAvg;

  ForecastDailyModel({
    required this.time,
    required this.temperatureAvg,
  });

  factory ForecastDailyModel.fromJson(Map<String, dynamic> json) {
    final values = json['values'];
    return ForecastDailyModel(
      time: json['time'] as String,
      temperatureAvg: values['temperatureAvg'] as double,
    );
  }
}
