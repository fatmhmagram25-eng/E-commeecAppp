import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimayButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final Color? textColor;
  final double? fontSize;
  final Widget? icon;
  final void Function()? onPress;
  final Widget? tralingIcon;
  final bool isLoading;
  const PrimayButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.textColor,
    this.onPress,
    this.icon,
    this.tralingIcon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordersRadius ?? 8.r),
          ),
          fixedSize: Size(width ?? 331.w, height ?? 56.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : SizedBox.shrink(),
            icon != null ? const WidthSpace(6) : SizedBox.shrink(),
            isLoading ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                )
              )
            ) : Text(
              buttonText ?? "",
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 16.sp,
              ),
            ),
            tralingIcon != null ? const WidthSpace(6) : SizedBox.shrink(),
            tralingIcon != null ? tralingIcon! : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
