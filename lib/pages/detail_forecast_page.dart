import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_friflex_test/models/forecast.dart';
import 'package:weather_friflex_test/widgets/forecast_detail_card.dart';

class DetailForecastPage extends StatelessWidget {
  final List<Forecast> dailyForecast;
  final String city;

  const DetailForecastPage({Key key, this.dailyForecast, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDate = dailyForecast[0].hour;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
          Text(
            'Прогноз погоды на 3 дня',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            city,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dailyForecast.length,
              itemBuilder: (context, i) {
                log(currentDate.toString());
                if (dailyForecast[i].hour == currentDate) {
                  return ForecastDetailCard(
                    description: dailyForecast[i].description,
                    humidity: dailyForecast[i].humidity,
                    windSpeed: dailyForecast[i].windSpeed,
                    title: dailyForecast[i].date.toString() +
                        '/' +
                        DateTime.now().year.toString(),
                    temperature:
                        dailyForecast[i].temperature.toStringAsFixed(0),
                    iconCode: dailyForecast[i].icon,
                    temperatureFontSize: 20,
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
