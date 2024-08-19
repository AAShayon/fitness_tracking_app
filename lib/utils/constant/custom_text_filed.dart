import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? textInputTypeKeyboard;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.prefixIcon,
    this.textInputTypeKeyboard,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);

    return Container(
      // width: AppHelperFunctions.widgetWidth(context, 200),
      // height: AppHelperFunctions.widgetHeight(context, 50),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.boxShadowDark.withOpacity(.08)
                :AppColors.boxShadowLight.withOpacity(.2),  // Modified light shadow color
            spreadRadius: 10,
            blurRadius: 40,
            offset: const Offset(0, 12),  // Slightly adjusted shadow
          ),
        ],
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: textInputTypeKeyboard,
          validator: validator,
          inputFormatters: inputFormatters,
          onTap: onTap,
          style:isDark? AppTextTheme.myAppText16(AppColors.grey):AppTextTheme.myAppText16(AppColors.secondaryDark),
          decoration: InputDecoration(
            errorMaxLines: 100,
            prefixIcon: Icon(
              prefixIcon,
              color: isDark ? AppColors.darkerGrey : AppColors.secondaryDark,  // Conditional color based on theme
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hoverColor: AppColors.darkerGrey,
            hintStyle: TextStyle(
              fontSize: 10,
              color: isDark ? AppColors.darkerGrey : AppColors.secondaryDark,  // Conditional hint color
            ),
            hintText: hintText,
          ),
          obscureText: obscureText,
          readOnly: readOnly,  // Set the readOnly property
        ),
      ),
    );
  }
}
