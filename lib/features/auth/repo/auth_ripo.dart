import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/animated_snack/service_locator.dart';
import 'package:e_commerce_app/core/animated_snack/storeh_helper.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/features/auth/model/login_respons_model.dart';

class AuthRepo {
  final DioHelper dioHelper;
  AuthRepo(this.dioHelper);
  
  Future<Either<String, LoginResponsModel>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.Login,
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponsModel loginResponsModel2 = LoginResponsModel.fromJson(
          response.data,
        );
        
        // ✅ التعديل هنا: إذا كان التوكن موجوداً (لا يساوي null)، نحفظه ونرجع حالة نجاح
        if (loginResponsModel2.token != null) {
           await sl<StorgeHelper>().saveToken(loginResponsModel2.token!);
           return Right(loginResponsModel2); 
        } 
        else {
           return Left("Token is null"); 
        }

      } else {
        return Left(response.toString());
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}