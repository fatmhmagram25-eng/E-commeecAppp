import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String CategoryName;
  
  const CategoryItemWidget({super.key, required this.CategoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text("All", style: AppStyles.black15BoldStyle),
      ),
    );
  }
}
