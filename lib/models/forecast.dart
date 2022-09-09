class Forecast {
  final String cityName;
  final double temperature;
  final String humidity;
  final String windSpeed;
  final String icon;
  final String description;
  final String date;
  final int hour;

  Forecast({
    this.cityName,
    this.temperature,
    this.humidity,
    this.windSpeed,
    this.icon,
    this.description,
    this.date,
    this.hour,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
              .day
              .toString() +
          '/' +
          DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000).day.toString(),
      hour: int.parse(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
              .toString()[11] +
          DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
              .toString()[12]),
    );
  }
}
