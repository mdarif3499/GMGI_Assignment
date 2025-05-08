import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:interview_task/home/controller/home_controller.dart';
import 'package:interview_task/home/home_screen/home_screen.dart';
import 'package:interview_task/splash_screen.dart';

import 'home/binding/auth_screen_bounding.dart';

final List<GetPage> appPages = [

  GetPage(name: SplashScreen.pageId, page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade
  ),


  GetPage(
      name: HomeScreen.pageId,
      binding: HomeScreenBindings(),
      transition: Transition.rightToLeftWithFade,
      page: () => HomeScreen()),
];
