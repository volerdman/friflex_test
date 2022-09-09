import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_friflex_test/models/forecast.dart';
import 'package:meta/meta.dart';

class ForecastService {
  static String apiKey = "47e72e9e9778e2579c9290f9dc2431ec";
  final http.Client httpClient;

  ForecastService({@required this.httpClient}) : assert(httpClient != null);

  Future<Forecast> fetchCurrentForecast(String query) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$apiKey&units=metric&lang=ru');

    log('request: ${url.toString()}');

    var response = await http.post(url);
    log(response.body.toString());

    if (response.statusCode == 200) {
      return Forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<List<Forecast>> fetchDailyForecast(String query) async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&appid=$apiKey&units=metric&lang=ru&cnt=21');
    final response = await http.post(url);

    log('request: ${url.toString()}');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Forecast> data =
          (jsonData['list'] as List<dynamic>).map((item) {
        return Forecast.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
