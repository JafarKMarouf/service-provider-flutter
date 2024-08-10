import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/book_service_info_minimum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/booking_infos_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer/shimmer.dart';

class HandleBookServiceListView extends StatelessWidget {
  const HandleBookServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BookServiceCubit, BookServiceState>(
        builder: (context, state) {
          if (state is BookServiceSuccess) {
            List<DatumBooked> booked = [];

            booked.addAll(state.bookService.data!.toList());
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: booked.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    g.Get.to(
                      () => BookingInfosView(data: booked[index]),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                  child: BookServiceInfosMinimum(data: booked[index]),
                );
              },
            );
          } else if (state is BookServiceFailure) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Center(child: Text(state.errMessage)),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 2, left: 4, top: 8, bottom: 2),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 12,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
