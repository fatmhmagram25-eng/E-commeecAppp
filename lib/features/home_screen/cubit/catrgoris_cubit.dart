import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home_screen/cubit/catogires_state.dart';
import 'package:e_commerce_app/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorisCubit extends Cubit<CategoiresState> {
  CategorisCubit(this._homerepo) : super(CategoiresInitial());
  final Homerepo _homerepo;

  void fetchCategores() async {
    emit(CategoiresLoading());
     
     final Either<String, List<String>> res= await _homerepo.getCategries();
    
    res.fold((error) {
      emit(CategoiresError(error));
    }, (catogires) {
      

      emit(CategoiresLoaded(catogires));
    });
  
  }
}
