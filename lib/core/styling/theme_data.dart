
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_fonts.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

class AppThemes {
  static final lightTheme = 
     ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: GoTransitions.slide,
            TargetPlatform.macOS: GoTransitions.slide,
            TargetPlatform.iOS: GoTransitions.slide,
          },
        ),
      
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      fontFamily: AppFonts.mainFontName,
      textTheme: TextTheme(
        titleLarge: AppStyles.primaryHeadLinesStyle,
        titleMedium: AppStyles.subtitlesStyles,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        disabledColor: AppColors.secondaryColor,
      ));
}
