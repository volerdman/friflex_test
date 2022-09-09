import 'package:meta/meta.dart';
import 'package:weather_friflex_test/models/forecast.dart';
import 'package:weather_friflex_test/services/forecast_service.dart';

class ForecastRepository {
  final ForecastService forecastService;

  ForecastRepository({@required this.forecastService})
      : assert(forecastService != null);

  Future<Forecast> getForecast(String city) async {
    return forecastService.fetchCurrentForecast(city);
  }

  Future<List<Forecast>> getDailyForecast(String city) async {
    return forecastService.fetchDailyForecast(city);
  }
}
