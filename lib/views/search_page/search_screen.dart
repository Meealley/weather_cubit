import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';
import 'package:weather_app/utils/app_textstyle.dart';
import 'package:weather_app/utils/button.dart';
import 'package:weather_app/utils/custom_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search City",
          style: AppTextStyles.bodyText,
        ),
      ),
      body: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == WeatherStatus.loaded) {
            // Navigate to the home screen once the weather data is loaded
            context.pushNamed(
              '/home',
              pathParameters: {
                'weather': state.weather.description
              }, // Use city name
            );
          } else if (state.status == WeatherStatus.error) {
            // Show an error message if the city is not found or there's a failure
            if (Platform.isIOS) {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "Error",
                        style: AppTextStyles.bodyText,
                      ),
                      content: Text(
                        'City not found',
                        style: AppTextStyles.bodySmall,
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text(
                            "Ok",
                            style: AppTextStyles.bodyText,
                          ),
                          onPressed: () => context.pop(),
                        )
                      ],
                    );
                  });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  'Please enter a valid city name',
                  style: AppTextStyles.bodyText,
                )),
              );
            }
          }
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    textEditingControlle: controller,
                    labelText: "Enter your city",
                  ),
                  const SizedBox(height: 10),
                  ButtonPress(
                    text: state.status == WeatherStatus.loading
                        ? "Loadiing..."
                        : "Search Weather",
                    onPressed: () {
                      final city = controller.text.trim();
                      if (city.isNotEmpty) {
                        context.read<WeatherCubit>().fetchWeather(city);
                      } else {
                        if (Platform.isIOS) {
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                    "Error",
                                    style: AppTextStyles.bodyText,
                                  ),
                                  content: Text(
                                    'Please enter a valid city name',
                                    style: AppTextStyles.bodySmall,
                                  ),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text(
                                        "Ok",
                                        style: AppTextStyles.bodyText,
                                      ),
                                      onPressed: () => context.pop(),
                                    )
                                  ],
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                              'Please enter a valid city name',
                              style: AppTextStyles.bodyText,
                            )),
                          );
                        }

                        // Show error message if input is empty
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
