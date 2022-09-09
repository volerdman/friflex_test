import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_friflex_test/models/forecast.dart';

abstract class ForecastState extends Equatable {
  ForecastState([List props = const []]) : super(props);
}

class ForecastLoad extends ForecastState {
  final Forecast forecast;
  final List<Forecast> dailyForecast;

  ForecastLoad({@required this.forecast, @required this.dailyForecast})
      : assert(forecast != null),
        super([forecast]);

  @override
  List<Object> get props => [forecast];
}

class ForecastError extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastEmpty extends ForecastState {}
