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
          "SearchScreen",
          style: AppTextStyles.bodyText,
        ),
      ),
      body: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
          if (controller.text.trim().isNotEmpty) {
            context.pushNamed('/home',
                pathParameters: {'weather': state.weather.country});
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
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPress(
                    text: "Where is your city?",
                    onPressed: () {
                      context
                          .read<WeatherCubit>()
                          .fetchWeather(controller.text);
                    },
                  ),
                  // Center(child: Text("Search Screen", style: AppTextStyles.bodyText))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
