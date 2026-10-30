import 'dart:async';

import 'package:e_commerce_app/core/animated_snack/service_locator.dart';
import 'package:e_commerce_app/core/animated_snack/storeh_helper.dart';
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<double> animation;
  @override
  void initState() {
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: animationcontroller,
      curve: Curves.easeOut,
    );
   waithAnimationAndNivigate();

    super.initState();
  }

  @override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }

  waithAnimationAndNivigate() async {
    await Future.delayed(const Duration(seconds: 3));
    sl<StorgeHelper>().getToken().then((value) {
      if (value != null && value.isNotEmpty) {
        context.pushReplacementNamed(AppRoutes.mainScreen);
      }else{
        context.pushReplacementNamed(AppRoutes.loginScreen);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.logo, width: 100.w, height: 100.h),
        ),
      ),
    );
  }
}
