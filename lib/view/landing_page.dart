import 'package:fitness_tracking_app/modules/activity/view/activity.dart';
import 'package:fitness_tracking_app/modules/home/view/home.dart';
import 'package:fitness_tracking_app/modules/profile/view/profile.dart';
import 'package:fitness_tracking_app/modules/statistics/view/statistics.dart';
import 'package:fitness_tracking_app/utils/constant/colors.dart';
import 'package:fitness_tracking_app/view/widgets/bottom_nav_bar.dart';
import 'package:fitness_tracking_app/viewModel/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
   LandingPage({super.key});
  final List<Widget> _screens = [
    const Home(),
    const Activity(),
    const Statistics(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingViewModel>(
      builder: (context,landingScreenViewModel,child){
        return WillPopScope(
          onWillPop: () async {
            if (landingScreenViewModel.currentIndex > 0) {
              landingScreenViewModel.goBackToPreviousIndex();
              return false;
            }
            else {
              bool exit = await _showExitDialog(context);
              return exit;
            }
          },
            child:Scaffold(
              body: _screens[landingScreenViewModel.currentIndex],
              bottomNavigationBar:const BottomNavBar(),
            ));
      },

    );
  }
   Future<bool> _showExitDialog(BuildContext context) async {
     return await showDialog<bool>(
       context: context,
       builder: (context) => AlertDialog(
         backgroundColor: AppColors.secondaryDark,
         title: const Text('Exit App', style: TextStyle(color: AppColors.primaryLight)),
         content: const Text('Are you sure you want to exit the app?', style: TextStyle(color: AppColors.textPrimary)),
         actions: [
           TextButton(
             onPressed: () => Navigator.of(context).pop(false),
             child: const Text('No', style: TextStyle(color: AppColors.textPrimary)),
           ),
           TextButton(
             onPressed: () => Navigator.of(context).pop(true),
             child: const Text('Yes', style: TextStyle(color: AppColors.textPrimary)),
           ),
         ],
       ),
     ) ??
         false; // In case the dialog is dismissed, return false
   }
}

