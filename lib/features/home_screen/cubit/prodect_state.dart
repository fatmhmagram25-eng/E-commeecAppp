import 'package:e_commerce_app/features/home_screen/models/prodect_models.dart';

abstract class ProdectState {}

class ProdectInitial extends ProdectState {}

class ProdectLoading extends ProdectState {}

class ProdectLoaded extends ProdectState {
  List<ProductModel> prodects;
  ProdectLoaded(this.prodects);
}

class ProdectError extends ProdectState {
  final String message;
  ProdectError(this.message);
}
