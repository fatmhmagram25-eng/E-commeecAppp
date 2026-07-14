
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/features/address/address_screen.dart';
import 'package:e_commerce_app/features/auth/login_screen.dart';
import 'package:e_commerce_app/features/auth/regster_screen.dart';
import 'package:e_commerce_app/features/main%20_screen/main_screen.dart';
import 'package:e_commerce_app/features/prodect_screen/prodect_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(
        initialLocation: AppRoutes.loginScreen,
         routes: [
   GoRoute(
    name: AppRoutes.loginScreen,
     path: AppRoutes.loginScreen,
     builder: (context, state) => const LoginScreen(),
   ),
   GoRoute(
      name: AppRoutes.registerScreen,
    path: AppRoutes.registerScreen, 
    builder: (context, state) => const RegsterScreen()),
     GoRoute(
      name: AppRoutes.mainScreen,
    path: AppRoutes.mainScreen, 
    builder: (context, state) => const MainScreen()),
    GoRoute(
      name: AppRoutes.productsScreen,
    path: AppRoutes.productsScreen, 
    builder: (context, state) => const prodectScreen ()),
     GoRoute(
      name: AppRoutes.addressScreen,
      path: AppRoutes.addressScreen,
      builder: (context, state) => const AddressScreen(),
    ),
    
  ]);
}
