

import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState{
  final String themeSelected;
  ThemeState({this.themeSelected="system"});
}



class ThemeModeCubit extends Cubit<ThemeState> {
  ThemeModeCubit() : super(ThemeState(themeSelected: "system"));

void changeTheme(String theme){
  emit(ThemeState(themeSelected: theme));
}

}