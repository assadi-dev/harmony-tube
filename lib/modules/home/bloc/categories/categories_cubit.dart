import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesState {
  List<String> categories;
  String selected;
  CategoriesState({required this.categories, this.selected = "all"});
}

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit()
    : super(
        CategoriesState(
          categories: [
            "all",
            "music",
            "gaming",
            "news",
            "sports",
            "movies",
            "education",
            "science",
            "technology",
            "travel",
            "food",
            "fashion",
            "beauty",
            "health",
            "fitness",
            "business",
            "finance",
            "politics",
            "entertainment",
            "comedy",
            "drama",
            "thriller",
            "horror",
            "romance",
            "action",
            "adventure",
            "animation",
            "documentary",
            "family",
            "history",
            "music",
            "news",
            "politics",
            "science",
            "sports",
            "technology",
            "travel",
            "food",
            "fashion",
            "beauty",
            "health",
            "fitness",
            "business",
            "finance",
            "politics",
            "entertainment",
            "comedy",
            "drama",
            "thriller",
            "horror",
            "romance",
            "action",
            "adventure",
            "animation",
            "documentary",
            "family",
            "history",
          ],
        ),
      );

  void setCategories(List<String> categories) {
    emit(CategoriesState(categories: categories));
  }

  void setSelected(String selected) {
    emit(CategoriesState(categories: state.categories, selected: selected));
  }
}
