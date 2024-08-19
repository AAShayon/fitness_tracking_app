import 'package:flutter/material.dart';

class AppColors{
  AppColors._();

  static const Color primaryLight=Color(0xFFFFFFFF);
  static const Color secondaryLight=Color(0xFFF5F5F5);
  static const Color accent=Color(0xFFF6F5F6);
  static const Color primaryDark = Color(0xFF000000);
  static const Color secondaryDark = Color(0xFF0A0A0A);
  static const Color magentaPink = Color(0xFFCD10C6);
  static const Color vibrantOrange = Color(0xFFF97316);
  static const Color vibrantCyan = Color(0xFF06B6D4);
  static const Color vibrantViolet = Color(0xFF8B5CF6);
  static const Color customGray = Color(0xFF667085);
  static const Color customYellow = Color(0xFFFFC727);
  static const Color customBlue = Color(0xFF407BFF);
  static const Color customRed = Color(0xFFFF725E);
  static const Color customBlack = Color(0xFF110C11);








  ///Gradient (gradiant color)

  static const Gradient primaryLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFF9953),
      Color(0xFFE8660D),
    ],
    stops: [0.0, 1.0],
  );
  static const Gradient secondLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE63D3D), // 75%
      Color(0xFFE63D3D), // 100%
    ],
    stops: [0.75, 1.0],
  );

  /// Third Linear Gradient
  static const Gradient greenLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3D9B26),
      Color(0xFF3D9B26),
    ],
    stops: [0.5625, 0.75],
  );
  /// Magenta Pink Linear Gradient
  static const Gradient magentaPinkLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFCD10C6), // 37.5%
      Color(0xFFCD10C6), // 50%
    ],
    stops: [0.375, 0.5],
  );
  static const Gradient vibrantOrangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF97316), // 16%
      Color(0xFFF97316), // 4%
    ],
    stops: [0.16, 0.04],
  );

  ///text Color

  static const Color textPrimary=Color(0xFF000B23);
  static const Color textColorBlack=Color(0xFF000B23);
  static const Color darkGray = Color(0xFF494949);
  static const Color textWhite=Colors.white;

  ///background Colors

  static const Color light=Color(0xFFF6F6F6);
  static const Color dark=Color(0xFF272727);
  static const Color primaryBackground=Color(0xFFF3F5FF);

  ///Container Colors

  static const Color lightContainer=Color(0xFFF6F6F6);
  static  Color darkContainer=AppColors.white.withOpacity(0.1);

  ///Button Colors

  static const Color buttonPrimary=Color(0xFF4b68ff);
  static const Color buttonSecondary=Color(0xFF6C7570);
  static const Color buttonDisable=Color(0xFFC4C4C4);

  ///border Colors

  static const Color borderPrimary=Color(0xFFD9D9D9);
  static const Color borderSecondary=Color(0xFFE6E6E6);

  ///Error and validation process Color

  static const Color error=Color(0xFFD32F2F);
  static const Color success=Color(0xFF9AFFB7);
  static const Color warning=Color(0xFFF57C00);
  static const Color info=Color(0xFF1976D2);

  /// (+-) Shades

  static const Color black=Color(0xFF232323);
  static const Color darkerGrey=Color(0xFF4F4F4F);
  static const Color darkGrey=Color(0xFF939393);
  static const Color grey=Color(0xFFE0E0E0);
  static const Color softGrey=Color(0xFFF4F4F4);
  static const Color lightGrey=Color(0xFFF9F9F9);
  static const Color white=Color(0xFFFFFFFF);
  static const Color red=Colors.red;
  static const Color orange=Colors.orange;
  static const Color black12=Colors.black12;
  static const Color boxShadowDark=Color(0xff43474d);
  static const Color boxShadowLight=Color(0xffc8c8c8);
}