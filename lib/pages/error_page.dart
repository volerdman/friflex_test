import 'package:flutter/material.dart';
import 'package:weather_friflex_test/bloc/forecast_bloc.dart';
import 'package:weather_friflex_test/pages/home_page.dart';

class ErrorPage extends StatefulWidget {
  final ForecastBloc forecastBloc;

  const ErrorPage({Key key, this.forecastBloc}) : super(key: key);
  @override
  State<ErrorPage> createState() => _ErrorPageState(forecastBloc);
}

class _ErrorPageState extends State<ErrorPage> {
  final ForecastBloc _forecastBloc;

  _ErrorPageState(this._forecastBloc);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var snackBar = SnackBar(
    content: Row(
      children: [
        Icon(Icons.dangerous),
        Text('Ошибка!'),
      ],
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(100),
    elevation: 10,
  );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.location_city,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                  forecastRepository: _forecastBloc.forecastRepository),
            ),
          ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Icon(
              Icons.warning,
              size: 300,
              color: Colors.red,
            ),
            Text(
              "Ошибка получения  данных!",
              style: TextStyle(fontSize: 30, color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
