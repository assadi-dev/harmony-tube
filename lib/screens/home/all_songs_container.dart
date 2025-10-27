import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/bloc/track/track_event.dart';
import 'package:harmony_tube/bloc/track/track_state.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/screens/home/more_track_actions.dart';
import 'package:harmony_tube/widgets/cards/music_card.dart';
import 'package:harmony_tube/widgets/modals/more_actions_list.dart';

import 'carousel/carousel_home.dart';

class AllSongsContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AllSongsContainerState();
}

class _AllSongsContainerState extends State<AllSongsContainer> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    context.read<TrackBloc>().add((GetAllTrackCollections()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (BuildContext context, TrackState state) {
        final StickyPosition initialPosition = StickyPosition(
            top: 200, left: 0);
        final StickyPosition finalPosition = StickyPosition(top: 0, left: 0);
        final List<TrackItemModel> tracks = state.collections;

        Widget IconTitleColumn() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(Icons.music_note_outlined),

              Text(
                "Touts les titres",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          );
        }

        return StickyContainer(
          displayOverFlowContent: true,
          stickyChildren: [
            StickyWidget(
              initialPosition: initialPosition,
              finalPosition: finalPosition,
              controller: _controller,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Theme
                      .of(context)
                      .scaffoldBackgroundColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [IconTitleColumn(), MoreTrackActions()],
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
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: list_spacing_icon_size,),
                    shrinkWrap: true,
                    itemCount: tracks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String id = index.toString();
                      final moreActions = MoreActionsList(
                          context: context, id: id, trackItem: tracks[index]);
                      return MusicCard(
                          moreOptionWidget: moreActions.musicCardActions(),
                          trackItem: tracks[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },);




  }
}
