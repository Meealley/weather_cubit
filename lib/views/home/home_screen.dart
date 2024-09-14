import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/constants/constants.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${state.weather.name} would be experiencing a ${widget.cityName} today",
                  style: AppTextStyles.bodyText,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Location: ${state.weather.name}",
                      style: AppTextStyles.bodyTextBold,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(${state.weather.country})',
                      style: AppTextStyles.bodyText,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    color: AppColors.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${state.weather.temp} ',
                                style: AppTextStyles.headingBold,
                              ),
                              Text(
                                TimeOfDay.fromDateTime(
                                        state.weather.lastupdated)
                                    .format(context),
                                style: AppTextStyles.bodySmall,
                              )
                            ],
                          ),
                          FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading2.gif",
                            image:
                                "http://$kIconHost/img/wn/${state.weather.icon}@4x.png",
                            width: 90,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
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
