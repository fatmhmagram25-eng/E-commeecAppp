import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class cartItemWidget extends StatelessWidget {
  const cartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 196, 189, 189),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            WidthSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product Name", style: AppStyles.black15BoldStyle,),
                      Spacer(),
                     
                      Icon(Icons.delete, color: Colors.red,)
                    ],
                  ),
                  const   HeightSpace(16),
                 
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1200", style: AppStyles.black15BoldStyle,),
                      Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
      
                          },
                          child: Container(
                            width: 27.w,
                            height: 29.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Icon(Icons.add,size: 12, color: Color.fromARGB(255, 55, 80, 181),),
                          
                          ),
                        ),
                        WidthSpace(16),
                        Text("1", style: AppStyles.black15BoldStyle,),
                        WidthSpace(16),
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                            width: 27.w,
                            height: 29.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Icon(Icons.remove,size: 12, color: Color.fromARGB(255, 50, 50, 151),),
                            
                                                  ),
                          ),
                    ])
                    ],
                  ),
                  
                ],
              ),
            ),
          
          ]),   
      ),
    );
  }
}