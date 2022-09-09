import 'package:flutter/material.dart';
import 'package:weather_friflex_test/bloc/forecast_bloc.dart';
import 'package:weather_friflex_test/bloc/forecast_event.dart';
import 'package:weather_friflex_test/pages/forecast_page.dart';
import 'package:weather_friflex_test/repository/forecast_repository.dart';

class HomePage extends StatefulWidget {
  final ForecastRepository forecastRepository;

  HomePage({Key key, @required this.forecastRepository})
      : assert(forecastRepository != null),
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  ForecastBloc forecastBloc;

  @override
  void initState() {
    forecastBloc = ForecastBloc(forecastRepository: widget.forecastRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(
          Icons.wb_sunny,
          color: Colors.black,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200.0,
          ),
          Center(
            child: Text(
              'Введите название города для отображения прогноза погоды:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Divider(),
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                  size: 30,
                ),
                hintText: "Введите город",
              ),
            ),
          ),
          Divider(
            height: 40.0,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              var city = textController.text;
              if (city != null) {
                forecastBloc.dispatch(FetchForecast(city: city));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ForecastPage(forecastBloc: forecastBloc),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.check_circle,
              size: 24.0,
            ),
            label: Text('Подтвердить'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    forecastBloc.dispose();
    super.dispose();
  }
}
