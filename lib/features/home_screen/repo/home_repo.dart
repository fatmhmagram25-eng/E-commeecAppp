import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/networking/api_endpoints.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/features/auth/model/login_respons_model.dart';
import 'package:e_commerce_app/features/home_screen/models/catores_model.dart';
import 'package:e_commerce_app/features/home_screen/models/prodect_models.dart';

class Homerepo {
  final DioHelper _dioHelper;

  Homerepo(this._dioHelper);

  Future<Either<String, List<ProductModel>>> getProdects() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.prodects,
      );

      if (response.statusCode == 200) {
        List<ProductModel> prodects = prodectFromJson(response.data);
        return Right(prodects);
      } else {
        return Left("some thing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> getProdectCategries(
    String cattName,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint:
            "${ApiEndpoints.prodects}/${ApiEndpoints.catprodect}/$cattName",
      );

      if (response.statusCode == 200) {
        List<ProductModel> prodects = prodectFromJson(response.data);
        return Right(prodects);
      } else {
        return Left("some thing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategries() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );

      if (response.statusCode == 200) {
        List<String> Categorie = cateogresFromJson(response.data);
        Categorie.insert(0, "All");
        return Right(Categorie);
      } else {
        return Left("some thing went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
