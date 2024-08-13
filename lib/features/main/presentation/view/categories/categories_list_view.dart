import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/main/presentation/view/categories/widgets/categories_gride_view_loading.dart';
import 'package:freelancer_app/features/main/presentation/view_models/category_cubit/category_cubit.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_datum.dart';

import 'widgets/categories_grid_view.dart';

class CategoriesListView extends StatelessWidget {
  final bool loading;
  const CategoriesListView({super.key, this.loading = true});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    List<CategoryDatum> categories = [];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const AspectRatio(aspectRatio: 12),
            const CustomeSearchArrowBackBar(),
            const SizedBox(height: 6),
            const Text(
              'الخدمات المتاحة',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategorySuccess) {
                  categories.addAll(state.category.data!.toList());
                }
                return state is CategorySuccess
                    ? Expanded(child: CategoriesGridView(data: categories))
                    : const Expanded(child: CategoriesGridViewLoading());
              },
            ),
          ],
        ),
      ),
    );
  }
}
