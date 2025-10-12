

import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/cards/header_bottom_sheet.dart';

class MusicModalAction extends StatelessWidget {

  final Widget child;
  const MusicModalAction({super.key,this.child = const SizedBox()});
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        HeaderBottomSheet(
title: "Music sans titre",
        ),
        Divider(
          height: 5,
          color: Colors.black12,
        ),
        SizedBox(height: 10,),
        child
      ],
    );


  }


}






