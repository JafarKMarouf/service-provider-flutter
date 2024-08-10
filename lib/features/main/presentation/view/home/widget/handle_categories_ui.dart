import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_datum.dart';

import 'package:freelancer_app/features/main/presentation/view/categories/widgets/categories_grid_view.dart';

import 'package:freelancer_app/features/main/presentation/view_models/category_cubit/category_cubit.dart';

import 'package:shimmer/shimmer.dart';

class HandleCategoriesUi extends StatelessWidget {
  const HandleCategoriesUi({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).fetchCategories();

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          List<CategoryDatum> categories = [];

          categories.addAll(state.category.data!.toList());
          return CategoriesGridView(data: categories);
        } else if (state is CategoryFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return SizedBox(
            height: 135,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 8,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
