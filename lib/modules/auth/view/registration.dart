import 'package:fitness_tracking_app/modules/auth/view/login.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/circuller_button.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/constant/custom_text_filed.dart';
import 'package:fitness_tracking_app/utils/constant/validators.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart'; // Icons_plus import

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _registrationFormKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedBusinessType;

  @override
  void dispose() {
    phoneNumberController.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark=AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: AppHelperFunctions.blurRadiusContainer(
        height: 840.h,width: 390.w,
        backgroundColor: isDark?AppColors.secondaryDark: AppColors.primaryLight,
        context: context,
        child: Form(
          key: _registrationFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 100.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome to Registration',
                      style:isDark? AppTextTheme.myAppText20(AppColors.primaryLight):AppTextTheme.myAppText20(AppColors.primaryDark),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    width: 350.w,
                    decoration: const BoxDecoration(
                      color:Colors.transparent,
                      // border: Border.all(color: Colors.deepPurple),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  hintText: 'Phone',
                                  prefixIcon: FontAwesome.mobile_solid, // Correct FontAwesome usage
                                  textInputTypeKeyboard: TextInputType.phone,
                                  controller: phoneNumberController,
                                  validator: (value) {
                              return AppValidator.validatePhoneNumber(value);
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                CustomTextFormField(
                                  hintText: 'Email',
                                  prefixIcon: FontAwesome.envelope, // Correct FontAwesome usage
                                  textInputTypeKeyboard: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (value) {
                                   return AppValidator.validateEmail(value);
                                  },
                                ),
                                SizedBox(height: 15.h),
                                CustomTextFormField(
                                  hintText: 'Name',
                                  prefixIcon: FontAwesome.user,
                                  textInputTypeKeyboard: TextInputType.text,
                                  controller: nameController,
                                  validator: (value) {
                                  return AppValidator.validateName(value);
                                  },
                                ),
                                SizedBox(height: 15.h),
                                CustomTextFormField(
                                  hintText: 'Password',
                                  prefixIcon: Icons.password, // Correct FontAwesome usage
                                  textInputTypeKeyboard: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  validator: (value) {
                                   return AppValidator.validatePassword(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomCircularButton(
                    text: 'Next',
                    onPressed: () {
                      if (_registrationFormKey.currentState!.validate()) {
                        AppHelperFunctions.navigateToScreenAndRemoveUntil(context, const Login());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
