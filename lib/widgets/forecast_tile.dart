import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  ForecastTile({
    @required this.icon,
    @required this.title,
    @required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon)],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
