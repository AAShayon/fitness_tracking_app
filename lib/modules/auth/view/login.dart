import 'dart:io';

import 'package:any_image_view/any_image_view.dart';
import 'package:fitness_tracking_app/modules/auth/view/registration.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/utils/constant/app_utility_helper.dart';
import 'package:fitness_tracking_app/utils/constant/circuller_button.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/utils/constant/custom_text_filed.dart';
import 'package:fitness_tracking_app/utils/constant/validators.dart';
import 'package:fitness_tracking_app/utils/theme/custom_themes/text_themes.dart';
import 'package:fitness_tracking_app/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      return Scaffold(
        body: AppHelperFunctions.blurRadiusContainer(
            borderRadius: 10,
            backgroundColor:
                isDark ? AppColors.secondaryDark : AppColors.primaryLight,
            height: 840.h,
            width: 390.w,
            context: context,
            child: ListView(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Center(
                  child: AnyImageView(
                    height: 200.h,
                    width: 200.w,
                    borderRadius: BorderRadius.circular(10),
                    imagePath: 'assets/app_icon_images/fitnessApplogo.svg',
                    boxFit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    'Login',
                    style: isDark
                        ? AppTextTheme.myAppText20(AppColors.primaryLight)
                        : AppTextTheme.myAppText20(AppColors.primaryDark),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Form(
                  key: _loginFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: CustomTextFormField(
                            hintText: 'Name',
                            prefixIcon: FontAwesome.user,
                            // Correct FontAwesome usage
                            textInputTypeKeyboard: TextInputType.name,
                            controller: nameController,
                            validator: (value) {
                              return AppValidator.validateName(value);
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(11),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: CustomTextFormField(
                            hintText: 'Password',
                            prefixIcon: Icons.password,
                            // Correct FontAwesome usage
                            textInputTypeKeyboard: TextInputType.name,
                            controller: passwordController,
                            validator: (value) {
                              return AppValidator.validatePassword(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showPicker(context),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? Icon(Icons.camera_alt, size: 40)
                        : null,
                  ),
                ),
                SizedBox(height: 10.h),
                if (_profileImage == null)
                  Center(
                    child: Text(
                      'Please Select A Picture',
                      style: AppTextTheme.myAppText14(AppColors.black),
                    ),
                  ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: CustomCircularButton(
                          width: 150.w,
                          text: 'Login',
                          onPressed: () async {
                            if (_loginFormKey.currentState!.validate()) {
                              if (nameController.text.isEmpty ){
                                AppHelperFunctions.showSuccessSnackBar(context, 'Please Enter Your Name', AppColors.error, 3);

                              }
                            else if (_profileImage == null) {
                                AppHelperFunctions.showSuccessSnackBar(context, 'Select A Picture', AppColors.error, 3);
                              } else {
                                await homeViewModel
                                    .login(
                                        name: nameController.text,
                                        profileImage: _profileImage)
                                    .then((isTrue) {
                                  if (context.mounted) {
                                    AppHelperFunctions
                                        .navigateToScreenAndRemoveUntil(
                                            context, LandingPage());
                                  }
                                });
                              }
                            }
                          }),
                    ),
                    Center(
                      child: CustomCircularButton(
                          width: 150.w,
                          text: 'Registration',
                          onPressed: () {
                            AppHelperFunctions.navigateToScreen(
                                context, const RegistrationPage());
                          }),
                    ),
                  ],
                ),
              ],
            )),
      );
    });
  }
}
