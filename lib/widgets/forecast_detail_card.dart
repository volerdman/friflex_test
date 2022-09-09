import 'package:flutter/material.dart';

class ForecastDetailCard extends StatelessWidget {
  final String title;
  final String temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;
  final String description;
  final String humidity;
  final String windSpeed;

  const ForecastDetailCard({
    Key key,
    this.title,
    this.temperature,
    this.iconCode,
    this.temperatureFontSize = 32,
    this.iconScale = 1,
    this.description,
    this.humidity,
    this.windSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.network(
                        "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
                        scale: this.iconScale),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      this.title,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${this.temperature}°C',
                      style: TextStyle(
                          fontSize: this.temperatureFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.opacity),
                    Text(
                      this.humidity + '%',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.waves),
                    Text(
                      this.windSpeed + ' м/с',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${this.description}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// crossAxisAlignment: CrossAxisAlignment.start, // Выравниваем по центру
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.network(
//                         "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
//                         scale: this.iconScale),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           this.title,
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           '${this.temperature}°C',
//                           style: TextStyle(
//                               fontSize: this.temperatureFontSize,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Text(
//                   '${this.description}',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(width: 30),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(Icons.opacity),
//                     Text(
//                       this.humidity + '%',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 20),
//                 Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(Icons.waves),
//                       Text(
//                         this.windSpeed + ' м/с',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ]),
//               ],
//             ),
//           ],
