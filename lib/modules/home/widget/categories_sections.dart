import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_chip_cubit.dart';
import 'package:harmony_tube/modules/home/widget/sections/category_rows.dart';

class CategoriesSections extends StatelessWidget {
  const CategoriesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesChipCubit, CategoriesChipState>(
      builder: (context, state) {
        final selectedCategory = state.selected;

        return Column(children: [CategoryRows(category: selectedCategory)]);
      },
    );
  }
}
