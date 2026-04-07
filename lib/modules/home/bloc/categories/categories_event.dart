import 'package:equatable/equatable.dart';

class CategoriesEvent extends Equatable {
  final String? selected;
  const CategoriesEvent({this.selected});

  @override
  List<Object?> get props => [selected!];
}

class LoadCategoriesCollectionsEvent extends CategoriesEvent {
  final String? category;
  const LoadCategoriesCollectionsEvent({this.category = "all"});
}
