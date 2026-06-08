import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState extends Equatable {
  final String themeSelected;

  const ThemeState({this.themeSelected = 'system'});

  @override
  List<Object?> get props => [themeSelected];
}

class ThemeModeCubit extends Cubit<ThemeState> {
  ThemeModeCubit() : super(const ThemeState(themeSelected: 'system'));

  void changeTheme(String theme) {
    emit(ThemeState(themeSelected: theme));
  }
}
