
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemsState {

  final List<String> fromItems;
  final List<String> toItems;


  SelectedItemsState({required this.fromItems,required this.toItems});
}

class SelectedItemsCubit extends Cubit<SelectedItemsState> {

  SelectedItemsCubit() : super(SelectedItemsState(fromItems: [], toItems: []));

  void addItemToFrom(String item) {
    List<String> newFromItems = List.from(state.fromItems)..add(item);
    emit(SelectedItemsState(fromItems: newFromItems, toItems: state.toItems));
  }

  void toggleFromItem(String item) {
    if (state.fromItems.contains(item)) {
      removeItemFromFrom(item);
      return;
    }
    addItemToFrom(item);


  }

  void toggleToItem(String item) {
    if (state.toItems.contains(item)) {
      removeItemFromTo(item);
      return;
    }
    addItemToTo(item);
  }

  void addItemToTo(String item) {
    List<String> newToItems = List.from(state.toItems)..add(item);
    emit(SelectedItemsState(fromItems: state.fromItems, toItems: newToItems));
  }
  void removeItemFromFrom(String item) {
    List<String> newFromItems = List.from(state.fromItems)..remove(item);
    emit(SelectedItemsState(fromItems: newFromItems, toItems: state.toItems));
  }
  void removeItemFromTo(String item){
    List<String> newToItems = List.from(state.toItems)..remove(item);
    emit(SelectedItemsState(fromItems: state.fromItems, toItems: newToItems));
  }
  void clearFrom() {
    emit(SelectedItemsState(fromItems: [], toItems: state.toItems));
  }
  void clearTo() {
    emit(SelectedItemsState(fromItems: state.fromItems, toItems: []));
  }
  void clearAll() {
    emit(SelectedItemsState(fromItems: [], toItems: []));
  }



}
