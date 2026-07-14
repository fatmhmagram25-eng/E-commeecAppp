import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegsterScreen extends StatefulWidget {
  const RegsterScreen({super.key});

  @override
  State<RegsterScreen> createState() => _RegsterScreenState();
}

class _RegsterScreenState extends State<RegsterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController FullName;
  late TextEditingController UserName;
  late TextEditingController password;
  late TextEditingController ConfirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserName = TextEditingController();
    password = TextEditingController();
    FullName = TextEditingController();
    ConfirmPassword = TextEditingController();
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
                      "Create an account",
                      style: AppStyles.primaryHeadLinesStyle,
                    ),
                  ),
                  SizedBox(
                    width: 289.w,
                    child: Text(
                      "it's grear on account",
                      style: AppStyles.grey12MediumStyle,
                    ),
                  ),
                  const HeightSpace(32),
                  Text("FullName", style: AppStyles.black15BoldStyle),
                  HeightSpace(8),
                  CustomTextField(
                    controller: FullName,
                    hintText: "Enter Your fullname",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your fullnane";
                      }
                      return null;
                    },
                  ),

                  const HeightSpace(32),
                  Text("UserName", style: AppStyles.black15BoldStyle),
                  HeightSpace(8),
                  CustomTextField(
                    controller: UserName,
                    hintText: "Enter Your Username",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Usernane";
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

                  const HeightSpace(15),
                  Text("confirmPassword", style: AppStyles.black15BoldStyle),
                  HeightSpace(8),
                  CustomTextField(
                    hintText: "Enter Your confirmPassword",
                    controller: ConfirmPassword,
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
                    buttonText: "Create acount",
                    onPress: () {
                      //    if (formKey.currentState!.validate()) {
                      // GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
                      //  }
                    },
                  ),
                  const HeightSpace(60),

                  Center(
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Do you have any qccount? ",
                          style: AppStyles.black15BoldStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "login",
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
