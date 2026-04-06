import 'package:bloc/bloc.dart';

class BottomBarState {
  final int currentIndex;
  final bool isBottomNavBarVisible;

  BottomBarState({required this.isBottomNavBarVisible, this.currentIndex = 0});

  BottomBarState copyWith({
    int? currentIndex,
    bool? isBottomNavBarVisible,
  }) {
    return BottomBarState(
      currentIndex: currentIndex ?? this.currentIndex,
      isBottomNavBarVisible:
          isBottomNavBarVisible ?? this.isBottomNavBarVisible,
    );
  }
}

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit()
      : super(BottomBarState(currentIndex: 0, isBottomNavBarVisible: true));

  void updateCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void showBottomNavBarVisibility(bool isVisible) {
    emit(state.copyWith(isBottomNavBarVisible:isVisible));
  }



}
