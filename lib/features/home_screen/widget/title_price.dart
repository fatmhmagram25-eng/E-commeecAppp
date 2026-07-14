import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlePrice extends StatelessWidget {
  final String title;
  final String price;
  const TitlePrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding
    ( padding: const EdgeInsetsDirectional.all( 8),
      child: Padding(
       
        padding: const EdgeInsetsDirectional.only(bottom: 8),
        child: Row(
          children: [
          Text(title, style: AppStyles.black15BoldStyle.copyWith(fontSize: 15.sp,color: const Color.fromARGB(255, 108, 106, 106)),),
          const Spacer(),
          Text(price, style: AppStyles.black15BoldStyle,)
          ],
        ),
      ),
    );
  }
}
