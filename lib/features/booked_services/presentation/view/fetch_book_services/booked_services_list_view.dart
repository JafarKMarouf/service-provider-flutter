import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/handle_bookservices_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

class BookedServicesListView extends StatelessWidget {
  const BookedServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        height: MediaQuery.sizeOf(context).height,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AspectRatio(aspectRatio: 12),
            CustomeSearchArrowBackBar(),
            SizedBox(height: 6),
            Text(
              'الخدمات المحجوزة',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 6),
            HandleBookServiceListView(),
          ],
        ),
      ),
    );
  }
}
