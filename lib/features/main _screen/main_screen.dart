import 'package:e_commerce_app/core/animated_snack/service_locator.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';

import 'package:e_commerce_app/features/home_screen/cubit/catrgoris_cubit.dart';
import 'package:e_commerce_app/features/home_screen/cubit/proect_cubit.dart';
import 'package:e_commerce_app/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProdectCubit>()),

        BlocProvider(create: (context) => sl<CategorisCubit>()),
      ],
      child: HomeScreen(),
    ),

    // CartScreen(),
    // AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
           
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30.sp),
              label: "cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined, size: 30.sp),
              label: "Acount",
            ),
          ],
        ),
      ),
    );
  }
}
