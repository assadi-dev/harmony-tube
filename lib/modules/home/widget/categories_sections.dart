import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_cubit.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';

class CategoriesSections extends StatelessWidget {
  const CategoriesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final selectedCategory = state.selected;
        if (selectedCategory == "all") {
          return Column(children: [Placeholder()]);
        }
        return Column(
          children: [AppTextTheme(selectedCategory), Placeholder()],
        );
      },
    );
  }
}
