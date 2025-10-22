import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/playlist_details/playlist_detail_more_button.dart';
import 'package:harmony_tube/widgets/cards/music_card.dart';

const double silverHeightExpanded = 250;

class playlist_detail_silver_widgets {
  final BuildContext context;

  playlist_detail_silver_widgets({required this.context});

  SliverAppBar silverHeader({required BuildContext context, required SliverConstraints constraints, required String playlistId, required String title, required String imageSrc})
  {

    final topInset = MediaQuery.of(context).padding.top;
    final collapseOffset = (silverHeightExpanded - kToolbarHeight - topInset)
        .clamp(1.0, double.infinity);

    // 0.0 (étendu) → 1.0 (collapssé)
    final t = (constraints.scrollOffset / collapseOffset).clamp(0.0, 1.0);

    // Couleurs à adapter :
    const Color iconStart = Colors.white; // état étendu (header sombre)
     Color iconEnd   = Theme.of(context).colorScheme.primary; // état collapssé (fond clair)
    final Color dynColor  = Color.lerp(iconStart, iconEnd, t)!;

    final overlay = t < 0.5
        ? SystemUiOverlayStyle.light  // status bar texte/icônes blancs
        : SystemUiOverlayStyle.dark;  // status bar texte/icônes noirs

    return SliverAppBar(
      foregroundColor: dynColor,
      systemOverlayStyle: overlay,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: silverHeightExpanded,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(imageSrc, fit: BoxFit.cover),
      ),
      actions: [
        PlaylistDetailMoreButton(playlistId: playlistId, title: title),
      ],
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
      padding: const EdgeInsets.symmetric(vertical: 18),

      child: Row(
        spacing: 10,
        children: [
          Expanded( child:  ActionButton(icon: Icons.play_arrow_outlined,
              title: 'Lecture',
              onPressed: () {})),
          Expanded( child:    ActionButton(icon: Icons.download_outlined,
              title: 'Télécharger',
              onPressed: () {}),),



        ],
      ),
    );
  }

  Widget silverTrackList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: ListView.separated(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(height: 10),
        itemBuilder: (context, index) {
          return MusicCard(moreOptionWidget: SizedBox(),);
        },
        itemCount: 15,
      ),
    );
  }

  SliverList silverTrackListSliver() {
    return SliverList.separated(

      separatorBuilder: (context, index) => const SizedBox(height: list_spacing_icon_size),
      itemBuilder: (context, index) {
        return MusicCard(moreOptionWidget: Text("more"),);
      },
      itemCount: 18,
    );
  }

  SliverPersistentHeader sliverPersistentHeader() {
    return SliverPersistentHeader(delegate: DelegateHeader(), pinned: true);
  }
}

class _CollapsingTitle extends StatelessWidget {
  final String text;

  const _CollapsingTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final settings =
    context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;


    final t = ((settings.maxExtent - settings.currentExtent) /
        (settings.maxExtent - settings.minExtent))
        .clamp(0.0, 1.0);

    final Color expandedColor = Colors.white;
    final Color collapsedColor = Theme
        .of(context)
        .colorScheme
        .primary;
    final color = Color.lerp(expandedColor, collapsedColor, t)!;

    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 150),
      style: Theme
          .of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: color),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
    );
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

class ActionButton extends StatelessWidget {

  final IconData icon;
  final String title;
  final void Function()? onPressed;

  ActionButton(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            gradient: LinearGradient(colors: [Theme
                .of(context)
                .colorScheme
                .secondary, Theme
                .of(context)
                .colorScheme
                .primary
            ], end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white),
                  Text(title, style: TextStyle(color: Colors.white),),
                ],),
            ),
          ),
        ),
      ),
    );
  }

}