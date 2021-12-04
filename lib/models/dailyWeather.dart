import 'package:flutter/cupertino.dart';

class DailyWeather with ChangeNotifier {
  var dailyTemp;
  var dailyTempF;
  var condition;
  var date;
  var precip;
  var uvi;
  var humidity;
  var windSpeed;
  var pressure;
  var pressure2;

  DailyWeather({
    this.dailyTemp,
    this.dailyTempF,
    this.condition,
    this.date,
    this.precip,
    this.uvi,
    this.humidity,
    this.windSpeed,
    this.pressure,
    this.pressure2,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    final precipData = json['daily'][0]['pop'];
    final calcPrecip = precipData * 100;
    final precipitation = calcPrecip.toStringAsFixed(0);
    return DailyWeather(
      precip: precipitation,
      uvi: json['daily'][0]['uvi'],
    );
  }

  static DailyWeather fromDailyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['temp']['day'],
      dailyTempF: (json['temp']['day']*9/5 + 32).toStringAsFixed(1),
      condition: json['weather'][0]['main'],
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      pressure: json['pressure'],
      pressure2: (json['pressure']*0.750062).toStringAsFixed(0),
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
    );
  }

  static DailyWeather fromHourlyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['temp'],
      condition: json['weather'][0]['main'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}
