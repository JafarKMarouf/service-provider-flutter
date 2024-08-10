import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/expert.dart'
    as books;
import 'package:freelancer_app/features/booked_services/data/models/book_services/service.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/user.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/booking_confirmation_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/freelancer_infos.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_expert.dart'
    as service;
import 'package:get/get.dart' as g;

class FreelancerInfosView extends StatelessWidget {
  final books.Expert? freelanceInfos;
  final service.ServiceExpert? expert;

  const FreelancerInfosView({
    super.key,
    this.freelanceInfos,
    this.expert,
  });

  @override
  Widget build(BuildContext context) {
    var bookService = BlocProvider.of<BookServiceCubit>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const AspectRatio(aspectRatio: 17), CustomeServiceBar(
              title: '${freelanceInfos?.user!.name ?? expert?.user!.name}',
            ),

            Expanded(
              child: FreelancerInfos(
                expert: expert,
                freelanceInfos: freelanceInfos,
              ),
            ),
           const Spacer(),

            expert != null
                ? CustomButton(
                    title: 'تفدم',
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      Future.delayed(
                        const Duration(microseconds: 250),
                        () {
                          var location =
                              '${bookService.currentPosition!.latitude},${bookService.currentPosition!.longitude}';
                          DatumBooked booked = DatumBooked(
                            expertId: bookService.expertId,
                            customerId: bookService.customerId,
                            serviceId: bookService.serviceId,
                            deliveryDate: bookService.deliveryDate.toString(),
                            deliveryTime: bookService.deliveryTime.toString(),
                            service: Service(
                              serviceName: bookService.serviceName,
                              photo: bookService.photo,
                            ),
                            expert: books.Expert(
                              user: User(
                                name: bookService.expertName,
                              ),
                              rating: bookService.rating,
                              mobile: bookService.mobile,
                              price: bookService.price,
                            ),
                            // description: bookService.description!.text,
                            // location: bookService.currentPosition.toString(),
                            location: location,
                          );
                          g.Get.to(
                            () => BookingConfirmationView(booked: booked),
                            transition: g.Transition.fadeIn,
                            duration: kDurationTransition,
                          );
                        },
                      );
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
