import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_cubit.dart';

class CategoriesChip extends StatelessWidget {
  const CategoriesChip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: state.categories.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilterChip(
                  label: Text(category),
                  selected: state.selected == category,
                  onSelected: (selected) {
                    context.read<CategoriesCubit>().setSelected(category);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
