import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_state.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';

class CategoryRows extends StatelessWidget {
  const CategoryRows({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [AppTextTheme(state.selected), Placeholder()],
          ),
        );
      },
    );
  }
}
