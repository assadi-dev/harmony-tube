import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/mock/categories_mock.dart';

class CategoriesChipState {
  List<String> categoriesChip;
  String selected;
  CategoriesChipState({required this.categoriesChip, this.selected = "all"});
}

class CategoriesChipCubit extends Cubit<CategoriesChipState> {
  CategoriesChipCubit()
    : super(CategoriesChipState(categoriesChip: categoriesChipListMock));

  void setCategories(List<String> categories) {
    emit(CategoriesChipState(categoriesChip: categories));
  }

  void setSelected(String selected) {
    emit(
      CategoriesChipState(
        categoriesChip: state.categoriesChip,
        selected: selected,
      ),
    );
  }
}
