import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/widgets/cards/music_card.dart';

import 'carousel/carousel_home.dart';

class AllSongsContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AllSongsContainerState();
}

class _AllSongsContainerState extends State<AllSongsContainer> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StickyPosition initialPosition = StickyPosition(top: 200, left: 0);
    final StickyPosition finalPosition = StickyPosition(top: 0, left: 0);

    return StickyContainer(
      displayOverFlowContent: true,
      stickyChildren: [
        StickyWidget(
          initialPosition: initialPosition,
          finalPosition: finalPosition,
          controller: _controller,
          child: Container(
            width: MediaQuery.of(context).size.width,

            child: Container(
              padding: EdgeInsets.all(15),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Icon(Icons.music_note_outlined),
                  SizedBox(width: 10),
                  Text(
                    "Touts les titres",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],

      child: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: EdgeInsets.all(padding_layout),
          child: Column(
            children: [
              CarouselHome(),
              SizedBox(height: 80),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10,),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return MusicCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
