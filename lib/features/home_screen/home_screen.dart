import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:e_commerce_app/features/home_screen/widget/category_item_widget.dart';
import 'package:e_commerce_app/features/home_screen/widget/prodect_item.dart';
import 'package:e_commerce_app/features/prodect_screen/prodect_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(28),
          SizedBox(
            width: 289.w,
            child: Text("Discover", style: AppStyles.primaryHeadLinesStyle),
          ),
          const HeightSpace(16),

          // حقل البحث والزر بجانبه
          Row(
            children: [
              CustomTextField(width: 270.w, hintText: "Search for products"),
              const WidthSpace(16),
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
          const HeightSpace(16),

          // قائمة الفئات الأفقية (Categories)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
                CategoryItemWidget(CategoryName: "Shoes"),
              ],
            ),
          ),
          const HeightSpace(16),

          // قائمة المنتجات (GridView) تم فصلها هنا لتأخذ بقية الشاشة عامودياً
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              children:  [
                ProdectItemWidget(
                  title: "Shoes",
                  price: "200 \$",
                  onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  },),
                ProdectItemWidget(title: "Shoes", price: "200 \$", onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  }, ),
                ProdectItemWidget(title: "Shoes", price: "200 \$", onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  },),
                ProdectItemWidget(title: "Shoes", price: "200 \$", onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  },),
                ProdectItemWidget(title: "Shoes", price: "200 \$", onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  },),
                ProdectItemWidget(title: "Shoes", price: "200 \$", onTap: (){
                    GoRouter.of(context).pushNamed(AppRoutes.productsScreen);
                  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
