import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';

import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:e_commerce_app/features/home_screen/cubit/catogires_state.dart';
import 'package:e_commerce_app/features/home_screen/cubit/catrgoris_cubit.dart';
import 'package:e_commerce_app/features/home_screen/cubit/prodect_state.dart';
import 'package:e_commerce_app/features/home_screen/cubit/proect_cubit.dart';
import 'package:e_commerce_app/features/home_screen/models/prodect_models.dart';
import 'package:e_commerce_app/features/home_screen/widget/category_item_widget.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedcat = "All";
  @override
  void initState() {
    super.initState();
    context.read<ProdectCubit>().fetchProdects();
    context.read<CategorisCubit>().fetchCategores();
  }

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

          // قائمة الفئات مع معالجة كاملة للحالات
          BlocBuilder<CategorisCubit, CategoiresState>(
            builder: (context, state) {
              if (state is CategoiresLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.catogires.map((cat) {
                      return CategoryItemWidget(
                        CategoryName: cat,
                        isSelected: selectedcat == cat ? true : false,
                        Onpress: () {
                          setState(() {
                            selectedcat = cat;
                            if (selectedcat == "All") {
                              context.read<ProdectCubit>().fetchProdects();
                            } else {
                              context
                                  .read<ProdectCubit>()
                                  .fetchProdectsCategory(cat);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              if (state is CategoiresError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "خطأ في تحميل الفئات: ${state.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          const HeightSpace(16),

          // قائمة المنتجات
          BlocBuilder<ProdectCubit, ProdectState>(
            builder: (context, state) {
              if (state is ProdectLoading) {
                // تمت إضافة return هنا لكي يظهر الشيمر
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 247, 247, 247),
                    highlightColor: const Color.fromARGB(255, 213, 195, 195),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150.w,
                          height: 150.h,
                          color: const Color.fromARGB(255, 200, 98, 98),
                        );
                      },
                    ),
                  ),
                );
              }
              if (state is ProdectLoaded) {
                List<ProductModel> Prodects = state.prodects;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onRefresh: () async {
                      selectedcat = "All";
                      selectedcat = "";
                      setState(() {});
                      context.read<ProdectCubit>().fetchProdects();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: Prodects.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            columnCount: 2,
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: GestureDetector(
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              if (state is ProdectError) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "خطأ: ${state.message}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}