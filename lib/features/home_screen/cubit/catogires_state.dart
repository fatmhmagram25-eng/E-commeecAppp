abstract class CategoiresState{}
class CategoiresInitial extends CategoiresState{}
class CategoiresLoading extends CategoiresState{}
class CategoiresLoaded extends CategoiresState{
  final List<String> catogires;
  CategoiresLoaded(this.catogires);
}

class CategoiresError extends CategoiresState{
  final String error;
  CategoiresError(this.error);
}