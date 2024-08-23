import 'package:donate_blood/app/module/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:donate_blood/app/route/pages.dart';
import 'package:donate_blood/app/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/module/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: RouteName.homeRoute,
      // home: const BottomNavigationView(),
      getPages: AppPages.routes,
    );
  }
}
