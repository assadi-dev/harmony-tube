import 'package:flutter/material.dart';

class playlist_detail_silver_widgets {
  final BuildContext context;

  playlist_detail_silver_widgets({required this.context});

  SliverAppBar silverHeader({required String title, required String imageSrc}) {
    return SliverAppBar(
      title: Text(title, textAlign: TextAlign.center),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(imageSrc, fit: BoxFit.cover),
      ),
    );
  }

  SliverToBoxAdapter silverBody() {
    return SliverToBoxAdapter(
      child: Container(

        child: Column(children: [silverPlaylistAction(), silverTrackList()]),
      ),
    );
  }

  SliverToBoxAdapter sliverToBoxPlaylistActions() {
    return SliverToBoxAdapter(
      child: Container(

        child: silverPlaylistAction(),
      ),
    );
  }

  silverPlaylistAction() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
              child: Icon(Icons.play_arrow_outlined, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  silverTrackList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: ListView.separated(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(height: 10),
        itemBuilder: (context, index) {
          return ListTile(title: Text('Track ${index + 1}'));
        },
        itemCount: 15,
      ),
    );
  }

  SliverList silverTrackListSliver() {
    return SliverList.separated(

      separatorBuilder: (context, index) => const Divider(height: 10),
      itemBuilder: (context, index) {
        return ListTile(title: Text('Track ${index + 1}'));
      },
      itemCount: 18,
    );
  }

  SliverPersistentHeader sliverPersistentHeader() {
    return SliverPersistentHeader(delegate: DelegateHeader(), pinned: true);
  }
}

class DelegateHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.red,
      height: 50,
      child: Text("hello", style: TextStyle(color: Colors.blue)),
    );
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
