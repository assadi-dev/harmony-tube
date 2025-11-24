import 'package:flutter_bloc/flutter_bloc.dart';

class SelectModeState {

  bool isActive;
  SelectModeState(this.isActive);

}

class SelectModeStateCubit extends Cubit<SelectModeState> {

  SelectModeStateCubit() : super(SelectModeState(false));

 void  setSelectModeState(bool value) {
    emit(SelectModeState(value));
  }

  void  toggleModeState() {
    emit(SelectModeState(!state.isActive));
  }
}




