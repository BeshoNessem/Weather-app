import 'package:weather_task2/data/model/current_weather_data.dart';
import 'package:weather_task2/data/model/forecast.dart';
import 'package:weather_task2/data/model/location.dart';

class WeatherDataModel {
  LocationModel? location;
  List<ForecastModel>? forecastedDays = [];
  CurrentWeatherModel? current;

  WeatherDataModel.fromMap(Map<String, dynamic> map) {
    location = LocationModel.fromMap(map["location"]);
    current = CurrentWeatherModel.fromMap(map["current"]);

    map["forecast"]["forecastday"].forEach((froecastmap) {
      forecastedDays!.add(ForecastModel.fromMap(froecastmap));
    });


  }
}