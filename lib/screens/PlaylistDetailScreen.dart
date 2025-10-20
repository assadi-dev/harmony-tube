import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final String id;
  final String? title;

  const PlaylistDetailScreen({
    super.key,
    required this.id,
    this.title,
  });

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  String playlistTitle = "";

  @override
  void initState() {
    super.initState();

    // Lance tes chargements/blocs après le premier frame si besoin
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final playlistId = widget.id;
      playlistTitle = widget.title ?? "Sans titre";

      print("Playlist id : $playlistId");
      print("Playlist title : $playlistTitle");


      // Exemple : déclencher un BLoC
      // context.read<LocalPlaylistBloc>()
      //     .add(GetPlaylistDetailEvent(id: playlistId));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Priorité : prop.title > titre chargé > fallback
    final appBarTitle = widget.title ??
        (playlistTitle.isNotEmpty ? playlistTitle : "Playlist");

    return Scaffold(

      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        slivers: [
          _silverHeader(title: appBarTitle, imageSrc: no_cover_image),
          _silverBody(),

        ],
      )
      ,
    );
  }
}


SliverAppBar _silverHeader({required String title, required String imageSrc}) {
  return SliverAppBar(
    title: Text(title,textAlign: TextAlign.center,),
    titleTextStyle: const TextStyle(color: Colors.white,fontSize: 14,overflow: TextOverflow.ellipsis),
centerTitle: true,
    floating: true,
    pinned: true,
    expandedHeight: 250,
    flexibleSpace: FlexibleSpaceBar(



      background: Image.asset(
        imageSrc,
        fit: BoxFit.cover,

      ),

    ),
  );
}

SliverList _silverBody() {
  return SliverList.separated(
    separatorBuilder: (context, index) => const Divider(height: 10),
    itemBuilder: (context, index) {
      return
        ListTile(title: Text('Track ${index + 1}'));
    },
    itemCount: 15,
  );
}

class DelegateHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(color: Colors.red,
      height: 50,
      child: Text("hello", style: TextStyle(color: Colors.blue),),);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}