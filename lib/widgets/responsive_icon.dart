import 'package:flutter/material.dart';
import 'package:harmony_tube/themes/app_colors.dart';

/**
 * Un widget qui affiche une icône dont la taille s'adapte en fonction des contraintes du widget parent.
 */
class ResponsiveIcon extends StatelessWidget {
  /**
   * L'icône à afficher.
   */
  final IconData icon;

  /**
   * La couleur de l'icône.
   * La valeur par défaut est [AppColors.bluePrimary].
   */
  final Color color;

  /**
   * Le facteur d'échelle à appliquer à la taille du parent pour déterminer la taille de l'icône.
   * Par exemple, une valeur de 0.5 rendra l'icône 50% de la taille du parent.
   * La valeur par défaut est 0.5.
   */
  final double scaleFactor;

  /**
   * S'il faut utiliser le côté le plus court du widget parent pour la mise à l'échelle.
   * Si vrai, la taille de l'icône sera basée sur le côté le plus court des contraintes du parent.
   * Si faux, elle sera basée sur la largeur maximale du parent.
   * La valeur par défaut est true.
   */
  final bool useMinSide;

  /**
   * Crée une icône responsive.
   *
   * Le paramètre [icon] est requis.
   */
  const ResponsiveIcon({
    super.key,
    required this.icon,
    this.color = AppColors.bluePrimary,
    this.scaleFactor = 0.5,
    this.useMinSide = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Détermine la taille de l'icône en fonction des contraintes du parent et des options de mise à l'échelle.
        double size = useMinSide
            ? constraints.biggest.shortestSide * scaleFactor
            : constraints.maxWidth * scaleFactor;

        return Icon(
          icon,
          color: color,
          size: size,
        );
      },
    );
  }
}
