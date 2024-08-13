import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';

import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/custome_freelancer_item.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_expert.dart';

class AvailableFreelancerView extends StatelessWidget {
  const AvailableFreelancerView({super.key, required this.expert});

  final List<ServiceExpert> expert;

  @override
  Widget build(BuildContext context) {
    var book = BlocProvider.of<BookServiceCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(child: CustomeSearchArrowBackBar()),
            CustomeInfosServiceItems(
              date: book.deliveryDate,
              time: book.deliveryTime,
              location: book.currentPosition.toString(),
              // location: book.currentAddress!,
              dateTapped: true,
              timeTapped: true,
              locationTapped: true,
            ),
            const SizedBox(height: 16),
            const Text(
              'الفريلانسر المتاحين',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  padding: EdgeInsets.zero,
                  itemCount: expert.length,
                  itemBuilder: (context, index) {
                    book.expertId = expert[index].id;
                    book.expertName = expert[index].user!.name;
                    book.price = expert[index].price;
                    book.mobile = expert[index].mobile;
                    return CustomeFreelancerItem(expert: expert[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
