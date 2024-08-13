import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_datum.dart';
import 'package:freelancer_app/features/main/presentation/view/services/services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';

class CategoryItemView extends StatelessWidget {
  final CategoryDatum data;
  const CategoryItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ServiceCubit>(context).fetchService(categoryId: data.id);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const AspectRatio(aspectRatio: 12),
            CustomeSearchArrowBackBar(title: data.title!),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                '${data.title}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const ServicesListView(),
          ],
        ),
      ),
    );
  }
}
