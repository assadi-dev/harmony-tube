import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/model/youtube_categories.dart';
import 'package:harmony_tube/modules/home/mock/categories_mock.dart';

class CategoriesChipsState {
  List<YoutubeCategory> categoriesChips;
  YoutubeCategory? selected;
  CategoriesChipsState({required this.categoriesChips, this.selected});
}

class CategoriesChipCubit extends Cubit<CategoriesChipsState> {
  CategoriesChipCubit()
    : super(
        CategoriesChipsState(
          categoriesChips: categoriesChipsListMock,
          selected: YoutubeCategory(title: "Toutes", params: "all"),
        ),
      );

  void setCategories(List<YoutubeCategory> categories) {
    emit(CategoriesChipsState(categoriesChips: categories));
  }

  void setSelected(YoutubeCategory? selected) {
    emit(
      CategoriesChipsState(
        categoriesChips: state.categoriesChips,
        selected: selected,
      ),
    );
  }
}
