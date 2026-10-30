import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/animated_snack/service_locator.dart'; // استيراد الـ Service Locator
import 'package:e_commerce_app/core/animated_snack/storeh_helper.dart'; // استيراد الـ Storage Helper
import 'package:e_commerce_app/features/auth/cubit/auth_state.dart';
import 'package:e_commerce_app/features/auth/model/login_respons_model.dart';
import 'package:e_commerce_app/features/auth/repo/auth_ripo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  void login({required String username, required String password}) async {
    emit(LoadingAuthState());
    
    final Either<String, LoginResponsModel> res = await _authRepo.login(username, password);

    res.fold(
      (error) => emit(ErrorAuthState(error)),
      (right) async {
        // 🔴 هنا السطر المفقود الذي يحل المشكلة!
        // حفظ التوكن في ذاكرة الجهاز أولاً عند نجاح تسجيل الدخول
        if (right.token != null && right.token!.isNotEmpty) {
          await sl<StorgeHelper>().saveToken(right.token!);
        }

        // إرسال حالة النجاح للشاشة بعد اكتمال التخزين
        emit(SuccessAuthState("Login Successfully"));
      },
    );
  }
}