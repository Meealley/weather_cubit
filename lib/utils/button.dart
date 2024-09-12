import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/app_textstyle.dart';

class ButtonPress extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ButtonPress({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundDark,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.buttonTextWhite,
            ),
          ),
        ),
      ),
    );
  }
}
