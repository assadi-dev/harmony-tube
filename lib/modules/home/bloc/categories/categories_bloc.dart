import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_event.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_state.dart';
import 'package:harmony_tube/modules/home/services/request_categories.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<LoadCategoriesCollectionsEvent>(_onLoadCategoriesCollectionsEvent);
  }

  void _onLoadCategoriesCollectionsEvent(
    LoadCategoriesCollectionsEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final collections = await fetchCategories(category: event.category!);
      emit(
        state.copyWith(
          collections: collections,
          isLoading: false,
          selected: event.category!,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e as Exception, isLoading: false));
    }
  }
}
