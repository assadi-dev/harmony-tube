import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_event.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_state.dart';
import 'package:harmony_tube/modules/home/model/youtube_categories.dart';
import 'package:harmony_tube/modules/home/services/youtube_api_service.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState()) {
    on<LoadCategoriesCollectionsEvent>(_onLoadCategoriesCollectionsEvent);
  }

  Future<void> _onLoadCategoriesCollectionsEvent(
    LoadCategoriesCollectionsEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    try {
      final collections = await fetchYoutubeCategoriesCollections(
        category: event.category?.params ?? defaultCategory.params,
      );
      emit(
        state.copyWith(
          collections: collections,
          isLoading: false,
          selected: event.category ?? defaultCategory,
          error: null,
        ),
      );
    } catch (e, st) {
      emit(
        state.copyWith(
          error: NetworkFailure(
            message: 'Impossible de charger les catégories',
            cause: e,
            stackTrace: st,
          ),
          isLoading: false,
        ),
      );
    }
  }
}
