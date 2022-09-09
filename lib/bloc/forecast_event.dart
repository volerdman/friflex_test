import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ForecastEvent extends Equatable {
  ForecastEvent([List props = const []]) : super(props);
}

class FetchForecast extends ForecastEvent {
  final String city;

  FetchForecast({@required this.city})
      : assert(city != null),
        super([city]);

  @override
  List<Object> get props => [city];
}
