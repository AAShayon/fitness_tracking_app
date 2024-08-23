import 'package:device_preview/device_preview.dart';
import 'package:fitness_tracking_app/modules/activity/view/activity.dart';
import 'package:fitness_tracking_app/modules/auth/view/login.dart';
import 'package:fitness_tracking_app/modules/auth/view/registration.dart';
import 'package:fitness_tracking_app/modules/home/view/home.dart';
import 'package:fitness_tracking_app/modules/home/viewModel/home_view_model.dart';
import 'package:fitness_tracking_app/modules/profile/view/profile.dart';
import 'package:fitness_tracking_app/modules/statistics/view/statistics.dart';
import 'package:fitness_tracking_app/utils/theme/theme.dart';
import 'package:fitness_tracking_app/view/splash_screen.dart';
import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", ""),
        Locale("bn", ""),
      ],
      path: 'lib/model/service/localization/language',
      child:   DevicePreview(enabled: !kReleaseMode, // Enable DevicePreview in non-release modes
          builder: (context) => MyApp())
      ,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(390, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            // Other providers
            ChangeNotifierProvider(create: (context) => SettingViewModel()),
            ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ],
          child: Consumer<SettingViewModel>(
            builder: (context, landingViewModel, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: landingViewModel.themeMode,
                initialRoute: '/', // Set SplashScreen as the initial route
                routes: {
                  '/': (context) => const SplashScreen(), // SplashScreen route
                  '/login': (context) => const Login(), // LoginScreen route
                  '/registrationPage': (context) => const RegistrationPage(),
                  '/home':(context)=>const Home(),
                  '/activity':(context)=>const Activity(),
                  '/statistics':(context)=>const Statistics(),
                  '/profile':(context)=>const Profile(),
                },
              );
            },
          ),
        );
      },
    );
  }
}
