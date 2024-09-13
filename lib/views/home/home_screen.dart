import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/app_textstyle.dart';
import 'package:http/http.dart' as http;

class WeatherScreeen extends StatefulWidget {
  final String cityName;
  const WeatherScreeen({super.key, required this.cityName});

  @override
  State<WeatherScreeen> createState() => _WeatherScreeenState();
}

class _WeatherScreeenState extends State<WeatherScreeen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _fetchWeather();
  // }

  // void _fetchWeather() {
  //   context.read<WeatherCubit>().fetchWeather(widget.cityName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather",
          style: AppTextStyles.heading,
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () async {
          //     context.push('/search');
          //     print("search appbar pressed");
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
              print("search appbar pressed");
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.loading) {
            Future.delayed(const Duration(seconds: 3), () {
              const CircularProgressIndicator.adaptive();
            });
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "This is the weather app ${widget.cityName}",
                    style: AppTextStyles.bodyText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.weather.name,
                  style: AppTextStyles.bodyTextBold,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    color: AppColors.secondary,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text(
                          '${state.weather.temp} ',
                          style: AppTextStyles.headingBold,
                        ),
                        Text(state.weather.icon),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
