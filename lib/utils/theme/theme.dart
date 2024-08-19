import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_themes.dart';
class AppTheme{
AppTheme._();

static ThemeData lightTheme=ThemeData(
 useMaterial3: true,
 fontFamily:'Montserrat',
  brightness: Brightness.light,
  primaryColor: AppColors.primaryLight,
  textTheme: AppTextTheme.lightTextTheme,
  scaffoldBackgroundColor: AppColors.primaryLight,
  appBarTheme: AppbarTheme.lightAppbarTheme,
  checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
  bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
  elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
  inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
  colorScheme: const ColorScheme.light(),

);
static ThemeData darkTheme=ThemeData(
  useMaterial3: true,
  fontFamily:'Montserrat',
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryDark,
  textTheme: AppTextTheme.darkTextTheme,
  scaffoldBackgroundColor: AppColors.primaryDark,
  appBarTheme: AppbarTheme.darkAppbarTheme,
  checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
  bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
  inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
  textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
  elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  colorScheme: const ColorScheme.dark(),

);
}
