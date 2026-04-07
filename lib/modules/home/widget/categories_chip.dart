import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_chip_cubit.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_event.dart';

class CategoriesChip extends StatelessWidget {
  const CategoriesChip({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(LoadCategoriesCollectionsEvent());
    return BlocBuilder<CategoriesChipCubit, CategoriesChipState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: state.categoriesChip.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilterChip(
                  label: Text(category),
                  selected: state.selected == category,
                  onSelected: (selected) {
                    context.read<CategoriesChipCubit>().setSelected(category);
                    context.read<CategoriesBloc>().add(
                      LoadCategoriesCollectionsEvent(category: category),
                    );
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
