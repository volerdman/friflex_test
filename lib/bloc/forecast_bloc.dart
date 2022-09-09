import 'package:weather_friflex_test/bloc/forecast_event.dart';
import 'package:weather_friflex_test/bloc/forecast_state.dart';

import 'package:bloc/bloc.dart';
import 'package:weather_friflex_test/models/forecast.dart';
import 'package:weather_friflex_test/repository/forecast_repository.dart';
import 'package:meta/meta.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  @override
  ForecastState get initialState => ForecastEmpty();

  final ForecastRepository forecastRepository;

  ForecastBloc({@required this.forecastRepository})
      : assert(forecastRepository != null);

  @override
  Stream<ForecastState> mapEventToState(
    ForecastState currentState,
    ForecastEvent event,
  ) async* {
    if (event is FetchForecast) {
      yield ForecastLoading();
      try {
        final Forecast forecast =
            await forecastRepository.getForecast(event.city);
        final List<Forecast> dailyForecast =
            await forecastRepository.getDailyForecast(event.city);
        yield ForecastLoad(forecast: forecast, dailyForecast: dailyForecast);
      } catch (_) {
        yield ForecastError();
      }
    }
  }
}
