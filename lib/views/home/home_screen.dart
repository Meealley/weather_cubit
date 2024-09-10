import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_textstyle.dart';

class WeatherScreeen extends StatefulWidget {
  const WeatherScreeen({super.key});

  @override
  State<WeatherScreeen> createState() => _WeatherScreeenState();
}

class _WeatherScreeenState extends State<WeatherScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather for today",
          style: AppTextStyles.bodyText,
        ),
      ),
      body: Center(
        child: Text(
          "This is the weather app home page",
          style: AppTextStyles.bodyText,
        ),
      ),
    );
  }
}
