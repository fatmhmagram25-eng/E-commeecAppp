import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// نصيحة: يفضّل دائماً جعل اسم الكلاس يبدأ بحرف كبير مثل ProductScreen
class prodectScreen extends StatelessWidget {
  const prodectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body: Stack(
        children: [
          // المحتوى القابل للتمرير
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(20),
                  Container(
                    height: 300.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 75, 69, 69),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  const HeightSpace(12),
                  Text(
                    "T-shirt",
                    style: AppStyles.black15BoldStyle.copyWith(fontSize: 20.sp),
                  ),
                  const HeightSpace(6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const WidthSpace(4),
                      Text(
                        "4.5/5",
                        style: AppStyles.black15BoldStyle.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const WidthSpace(2),
                      Text(
                        "(45 Reviews)",
                        style: AppStyles.black15BoldStyle.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const HeightSpace(12),
                  Text(
                    "djsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoa djsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapdjsdjusuddddddddddddhuahuuuuuuuuuuuuuuuuiuoioapoapp",
                    style: AppStyles.grey12MediumStyle.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HeightSpace(300), // مساحة إضافية في الأسفل حتى لا يغطي الـ Bottom Bar على النص عند التمرير
                ],
              ),
            ),
          ),

          // الجزء الثابت في الأسفل (السعر والزر)
          Positioned(
            bottom: 0,
            
            child: Container(
              color:  Colors.white,
                   
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  const HeightSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: AppStyles.black15BoldStyle.copyWith(fontSize: 20.sp)),
                          const HeightSpace(2),
                          Text("\$20", style: AppStyles.black15BoldStyle.copyWith(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      WidthSpace(20.w),
                      PrimayButtonWidget(
                        buttonText: "Add to Cart",
                        icon:Icon(Icons.add_shopping_cart, color: Colors.white,),
                        width:MediaQuery.of(  context).size.width*0.4,
                        onPress: () {
                        
                        },
                      )
                      // يمكنك هنا إضافة زر الـ "Add to Cart" بجانب السعر مستقبلاً
                    ],
                  ),
                  const HeightSpace(15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}