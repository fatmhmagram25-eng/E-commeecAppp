import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String CategoryName;
  final VoidCallback? Onpress;
  final bool isSelected;

  const CategoryItemWidget({super.key, required this.CategoryName, this.Onpress, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Onpress ?? () {},
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            border:isSelected ? null :
             Border.all(color: Colors.green, width: 0.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(CategoryName, style: AppStyles.black15BoldStyle.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          )),
        ),
      ),
    );
  }
}
