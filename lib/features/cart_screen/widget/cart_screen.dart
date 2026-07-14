import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:e_commerce_app/features/home_screen/widget/cart_item_wedget.dart';
import 'package:e_commerce_app/features/home_screen/widget/title_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// نصيحة: يفضّل دائماً جعل اسم الكلاس يبدأ بحرف كبير مثل ProductScreen
class CartScreen extends StatelessWidget {
  const CartScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
        centerTitle: true,
        leading: Container(),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   cartItemWidget(),
                   cartItemWidget(),
                   cartItemWidget(),
                   cartItemWidget(),
                            HeightSpace(16),
          
             TitlePrice(title: "sup totol", price: "\$ 2000"),

                 TitlePrice(title: "sup totol", price: "\$ 2000"),
                     TitlePrice(title: "sup totol", price: "\$ 2000"),
                     Divider(),
                     TitlePrice(title: "sup totol", price: "\$ 2000"),
                     
                    
                    PrimayButtonWidget(
                        buttonText: "Go to Checkout",
                       tralingIcon:Icon(Icons.add_shopping_cart, color: Colors.white,),
                        onPress: () {
                        
                        },
                      ),
                      HeightSpace(16),
                ],
              ),
      )
      );
  }
}