import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Téléchargements"),
      ),
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Mes Téléchargements")],
        ),
      ),
    );
  }

}
