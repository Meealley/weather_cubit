import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          "Weather",
          style: AppTextStyles.heading,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push('/search');
              print("search appbar pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
              print("search appbar pressed");
            },
          ),
        ],
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
