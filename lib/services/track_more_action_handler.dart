import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class TrackMoreActionHandler {
final BuildContext context;
TrackMoreActionHandler({required this.context});

  void playAll()  {
    Navigator.of(context).pop();
  }
  void shuffleAll() {
    Navigator.of(context).pop();
  }

  void searchInYoutube (){
    Navigator.of(context).pop();
  }

  void addTrack (){
    WoltModalSheet.of(context).showNext();
  }

  void saveTrack (){
    Navigator.of(context).pop();
  }


void openAudioFiles(){
  Navigator.of(context).pop();
}

void openFileManager(){
  Navigator.of(context).pop();
}

}