class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_min;
  final temp_max;

  WeatherModel(
      {this.temp, this.pressure, this.humidity, this.temp_min, this.temp_max});

  double get getTemp => temp;

  double get getMaxTemp => temp_max;

  double get getMinTemp => temp_min;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        temp: json["temp"],
        pressure: json["pressure"],
        humidity: json["humidity"],
        temp_min: json["temp_min"],
        temp_max: json["temp_max"]);
  }
}
