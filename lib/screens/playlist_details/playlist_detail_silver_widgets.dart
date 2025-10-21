import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

const double silverHeightExpanded = 250;

class playlist_detail_silver_widgets {
  final BuildContext context;

  playlist_detail_silver_widgets({required this.context});

  SliverAppBar silverHeader(
      {required BuildContext context, required SliverConstraints constraints, required String title, required String imageSrc}) {

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

      title: _CollapsingTitle(title),
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
