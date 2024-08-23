import 'package:donate_blood/app/module/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:donate_blood/app/module/login/view/login_view.dart';
import 'package:donate_blood/app/module/signup/view/signup_view.dart';
import 'package:donate_blood/app/route/routes.dart';
import 'package:get/get.dart';

import 'package:donate_blood/app/module/post/view/create_post_view.dart';

class AppPages {
  static String initial = RouteName.initialRoute;

  static final routes = [
    GetPage(
      name: RouteName.homeRoute,
      page: () => const BottomNavigationView(),
      transition: Transition.fade,
    ),

    GetPage(
      name: RouteName.createPostRoute,
      page: () => const CreatePostView(),
      transition: Transition.fade,
    ),

    GetPage(
      name: RouteName.loginRoute,
      page: () => const LoginView(),
      transition: Transition.fade,
    ),

    GetPage(
      name: RouteName.signupRoute,
      page: () => const SignupView(),
      transition: Transition.fade,
    ),
  ];
}
