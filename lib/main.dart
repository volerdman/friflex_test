import 'package:flutter/material.dart';
import 'package:weather_friflex_test/pages/home_page.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_friflex_test/repository/forecast_repository.dart';
import 'package:weather_friflex_test/services/forecast_service.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  final ForecastRepository forecastRepository = ForecastRepository(
    forecastService: ForecastService(httpClient: http.Client()),
  );
  runApp(MyApp(forecastRepository: forecastRepository));
}

class MyApp extends StatelessWidget {
  final ForecastRepository forecastRepository;

  MyApp({Key key, @required this.forecastRepository})
      : assert(forecastRepository != null),
        super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(
          forecastRepository: forecastRepository,
        ),
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Transition transition) {
    print(transition);
  }
}
