import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController UserName;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserName = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(12),

                  SizedBox(
                    width: 289.w,
                    child: Text(
                      "login to your account",
                      style: AppStyles.primaryHeadLinesStyle,
                    ),
                  ),
                  SizedBox(
                    width: 289.w,
                    child: Text(
                      "it's greate to see you agin",
                      style: AppStyles.grey12MediumStyle,
                    ),
                  ),
                  const HeightSpace(32),
                  Text("UserName", style: AppStyles.black15BoldStyle),
                  HeightSpace(8),
                  CustomTextField(
                    controller: UserName,
                    hintText: "Enter Your UserName",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your UserName";
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(15),
                  Text("Password", style: AppStyles.black15BoldStyle),
                  HeightSpace(8),
                  CustomTextField(
                    hintText: "Enter Your Password",
                    controller: password,
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.greyColor,
                      size: 20.sp,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),

                  const HeightSpace(30),
                  PrimayButtonWidget(
                    buttonText: "Sing in",
                    onPress: () {
                      context.pushNamed(AppRoutes.mainScreen);
                      //    if (formKey.currentState!.validate()) {
                      // GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
                      //  }
                    },
                  ),
                  const HeightSpace(300),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.registerScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppStyles.black15BoldStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "join",
                              style: AppStyles.black15BoldStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
