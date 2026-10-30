import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showanimatedsnackdiloge(

BuildContext context ,{

 String?message,
AnimatedSnackBarType? type,
}){
  AnimatedSnackBar.material(
  message ?? "",
    type: type ?? AnimatedSnackBarType.success,
    mobileSnackBarPosition: MobileSnackBarPosition.top,
   desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
  ).show(context);
}

