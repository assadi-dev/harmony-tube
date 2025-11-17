import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

Widget GoBack(BuildContext context){

  void goBack() {
    WoltModalSheet.of(context).showPrevious();
  }

  return IconButton(
    onPressed: goBack,
    icon: Icon(Icons.arrow_back_ios_new, size: 20),

  );
}