import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdectItemWidget extends StatelessWidget {
  final String title;
  final String price;
final Function()? onTap;
  
  const ProdectItemWidget({super.key, required this.title, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? (){},
      child: Container(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r,),
            child: Container(
              height: 160.h,
              width: 160.w,
              color: const Color.fromARGB(255, 180, 104, 104),
      
            ),
          ),
          HeightSpace(8),
          Text(title, style: AppStyles.black15BoldStyle,),
          HeightSpace(8),
          Text(price, style: AppStyles.black15BoldStyle,)
         ],
       )
      ),
    );
  }
}
