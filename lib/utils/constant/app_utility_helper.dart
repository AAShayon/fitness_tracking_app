import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';

class AppHelperFunctions {
  static void showSuccessSnackBar(BuildContext context, String message,Color color,int time) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message,style: AppTextTheme.myAppText161(color),),duration:  Duration(milliseconds: time),backgroundColor: color,),
    );
  }

  static void showAlert(BuildContext context, String title, String message,Color backgroundColor,dynamic onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:backgroundColor ,
          title: Text(title,style: AppTextTheme.myAppText161(Colors.red),),
          content: Text(message,style: AppTextTheme.myAppText161(Colors.red),),
          actions: [
            TextButton(
              onPressed: onPressed,
              child:  Text('OK',style: AppTextTheme.myAppText161(Colors.red),),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
  static void navigateToScreenAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (Route<dynamic> route) => false,
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength);
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }


  // static String getFormattedDate(
  //     BuildContext context,
  //     DateTime date, {
  //       String format = 'dd MMM yyyy',
  //     }) {
  //   return DateFormat(format).format(date);
  // }
  static String getFormattedDate(
      BuildContext context,
      DateTime date, {
        String format = 'dd MMM yyyy',
      }) {
    Locale currentLocale = context.locale; // Get the current locale

    // Format date based on locale (English or Bengali)
    if (currentLocale.languageCode == 'bn') {
      return DateFormat('dd MMMM yyyy', 'bn_BD').format(date); // Bengali date format
    } else {
      return DateFormat('dd MMMM yyyy', 'en_US').format(date); // English date format
    }
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(
      BuildContext context,
      List<Widget> widgets,
      int rowSize,
      ) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
  static Widget blurRadiusContainer({
    required BuildContext context,
    double blurRadius = 10.0,
    double borderRadius = 20.0,
    required Widget child,
    Color? backgroundColor,
    String? imageUrl,
    String? imagePath,
    double height = 450,
    double width = 370,
    BoxFit imageFit = BoxFit.cover,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color effectiveBackgroundColor = backgroundColor ??
        (isDarkMode ? Colors.black.withOpacity(.2) : Colors.white.withOpacity(0.7));

    ImageProvider? imageProvider;

    if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl);
    } else if (imagePath != null) {
      imageProvider = AssetImage(imagePath);
    }

    return Container(
      height:height,
      width:width,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        image: imageProvider != null
            ? DecorationImage(
          image: imageProvider,
          fit: imageFit,
        )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: Container(
            decoration: BoxDecoration(
              color: effectiveBackgroundColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}