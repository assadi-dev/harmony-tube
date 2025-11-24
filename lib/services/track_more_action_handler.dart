import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/core/utils/interraction.dart';
import 'package:harmony_tube/cubit/select_mode_cubit.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
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
    WoltModalSheet.of(context).showPageWithId("add_new_track");
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

void selectMode() {
    vibrate();
    BlocProvider.of<SelectedItemsCubit>(context).clearAll();
    BlocProvider.of<SelectModeStateCubit>(context).toggleModeState();
    Navigator.of(context).pop();
  }
  
  
  void addToPlaylist(){
    WoltModalSheet.of(context).showPageWithId("playlist_select");

  }
  
  
}