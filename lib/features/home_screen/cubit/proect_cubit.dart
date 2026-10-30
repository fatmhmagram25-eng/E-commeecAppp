import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home_screen/cubit/prodect_state.dart';
import 'package:e_commerce_app/features/home_screen/models/prodect_models.dart';
import 'package:e_commerce_app/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdectCubit extends Cubit<ProdectState> {
  ProdectCubit(this._homerepo) : super(ProdectInitial());
  final Homerepo _homerepo;

  void fetchProdects( ) async {
    emit(ProdectLoading());

    final res = await _homerepo.getProdects();
    res.fold(
      (error) {
        emit(ProdectError(error));
      },
      (right) {
        emit(ProdectLoaded(right));
      },
    );
  }

  void fetchProdectsCategory(String cattName) async {
    emit(ProdectLoading());

    final res = await _homerepo.getProdectCategries(cattName);
    res.fold(
      (error) {
        emit(ProdectError(error));
      },
      (right) {
        emit(ProdectLoaded(right));
      },
    );
  }
}
