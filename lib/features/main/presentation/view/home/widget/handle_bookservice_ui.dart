import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/book_service_info_minimum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/booking_infos_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart' as g;

class HandleBookServiceUi extends StatelessWidget {
  const HandleBookServiceUi({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();
    return BlocBuilder<BookServiceCubit, BookServiceState>(
      builder: (context, state) {
        if (state is BookServiceSuccess) {
          List<DatumBooked> booked = [];

          booked.addAll(state.bookService.data!.toList());
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
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
            ),
          );
        } else if (state is BookServiceFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(right: 22),
                    // height: 40,
                    width: MediaQuery.sizeOf(context).width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class HandleBookServiceBody extends StatelessWidget {
  const HandleBookServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<DatumBooked> booked = [];
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();

    return Expanded(
      flex: 4,
      child: BlocBuilder<BookServiceCubit, BookServiceState>(
        builder: (context, state) {
          if (state is BookServiceSuccess) {
            booked.addAll(state.bookService.data!.toList());
            return SizedBox(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: booked.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => g.Get.to(
                        () => BookingInfosView(data: booked[index]),
                        transition: g.Transition.fadeIn,
                        duration: kDurationTransition,
                      ),
                      child: BookServiceInfosMinimum(data: booked[index]),
                    );
                  }),
            );
          } else if (state is BookServiceFailure) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: Center(child: Text(state.errMessage)),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(right: 22),
                    // height: 40,
                    width: MediaQuery.sizeOf(context).width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.blue,
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
