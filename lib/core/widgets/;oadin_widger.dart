import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class loadinWidget extends StatelessWidget {
   final double? width;
  final double? height;
  const loadinWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: Center(
        child: Center(
          child: LottieBuilder.asset(AppAssets.loading, width: 100, height: 100),

        )
      ),
    );
  }
}