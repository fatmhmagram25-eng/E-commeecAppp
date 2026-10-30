import 'package:e_commerce_app/core/animated_snack/service_locator.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/core/routing/router_generation_config.dart';
import 'package:e_commerce_app/core/styling/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_transitions/go_transitions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(398, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
           
         
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
