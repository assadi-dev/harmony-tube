import 'package:flutter/cupertino.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/themes/app_colors.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(border_radius),
        gradient: LinearGradient(
          colors: [AppColors.bluePrimary, AppColors.blueSecondary],
          stops: [0, 1],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ Text("Carousel")]
      ),
    );
  }
}
