import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_friflex_test/bloc/forecast_bloc.dart';
import 'package:weather_friflex_test/bloc/forecast_state.dart';
import 'package:weather_friflex_test/models/forecast.dart';
import 'package:weather_friflex_test/pages/detail_forecast_page.dart';
import 'package:weather_friflex_test/pages/error_page.dart';
import 'package:weather_friflex_test/widgets/forecast_tile.dart';
import 'package:meta/meta.dart';

class ForecastPage extends StatefulWidget {
  ForecastPage({Key key, @required this.forecastBloc}) : super(key: key);

  final ForecastBloc forecastBloc;

  @override
  State<ForecastPage> createState() => ForecastPageState(forecastBloc);
}

class ForecastPageState extends State<ForecastPage> {
  BuildContext scaffoldContext;
  final ForecastBloc forecastBloc;
  List<Forecast> dailyForecast;
  Forecast forecast;
  ForecastPageState(this.forecastBloc);
  var snackBar =
      new SnackBar(content: new Text("message"), backgroundColor: Colors.red);

  @override
  Widget build(BuildContext context) {
    scaffoldContext = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.thermostat_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailForecastPage(
                    dailyForecast: getSortDailyForecast(dailyForecast),
                    city: forecast.cityName,
                  ),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WeatherApp',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          BlocBuilder(
            bloc: forecastBloc,
            builder: (_, ForecastState state) {
              if (state is ForecastEmpty) {
                return Center(child: Text('Please Select a Location'));
              }
              if (state is ForecastLoading) {
                return Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 10,
                  )),
                );
              }
              if (state is ForecastLoad) {
                forecast = state.forecast;
                dailyForecast = state.dailyForecast;
                return Center(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[400],
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                              forecast.cityName,
                              style: TextStyle(fontSize: 32),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              forecast.temperature.toStringAsFixed(0) + '°C',
                              style: TextStyle(fontSize: 32),
                            ),
                            Image(
                              image: NetworkImage(
                                  'http://openweathermap.org/img/wn/' +
                                      forecast.icon +
                                      '@2x.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView(
                          children: [
                            ForecastTile(
                              icon: Icons.thermostat_outlined,
                              title: 'Температура',
                              subTitle:
                                  forecast.temperature.toStringAsFixed(0) +
                                      '°C',
                            ),
                            ForecastTile(
                              icon: Icons.cloud,
                              title: 'Погода',
                              subTitle: forecast.description,
                            ),
                            ForecastTile(
                              icon: Icons.opacity,
                              title: 'Влажность',
                              subTitle: forecast.humidity + '%',
                            ),
                            ForecastTile(
                              icon: Icons.waves,
                              title: 'Скорость ветра',
                              subTitle: forecast.windSpeed + ' м/с',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is ForecastError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ErrorPage(forecastBloc: forecastBloc),
                    ),
                  );
                });
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  List<Forecast> getSortDailyForecast(List<Forecast> dailyForecast) {
    var minTemp = dailyForecast[1].temperature;
    var temp;
    var counter;
    for (int i = 0; i < dailyForecast.length; i++) {
      if (dailyForecast[i].temperature < minTemp) {
        minTemp = dailyForecast[i].temperature;
        temp = dailyForecast[i];
        counter = i;
      }
    }
    dailyForecast[counter] = dailyForecast[0];
    dailyForecast[0] = temp;
    return dailyForecast;
  }
}
