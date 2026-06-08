import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectModeState extends Equatable {
  final bool isActive;

  const SelectModeState(this.isActive);

  @override
  List<Object?> get props => [isActive];
}

class SelectModeStateCubit extends Cubit<SelectModeState> {
  SelectModeStateCubit() : super(const SelectModeState(false));

  void setSelectModeState(bool value) {
    emit(SelectModeState(value));
  }

  void toggleModeState() {
    emit(SelectModeState(!state.isActive));
  }
}
