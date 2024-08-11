import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_dialog.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/widget/add_notes_for_book.dart';
import 'package:freelancer_app/features/payment/presentation/view/payment_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shimmer/shimmer.dart';

class BookingConfirmationView extends StatelessWidget {
  final DatumBooked? booked;
  const BookingConfirmationView({super.key, required this.booked});

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
      body: BlocConsumer<BookServiceCubit, BookServiceState>(
        listener: (context, state) {
          if (state is BookServiceAddLoading) {
            loading = true;
          } else if (state is BookServiceAddFailure) {
            loading = false;
            g.Get.dialog(
              CustomeDialog(
                message: state.errMessage,
                image: AppImages.sadsvg,
              ),
              barrierDismissible: false,
              barrierColor: const Color(0xffFFFDFD),
            );
            Future.delayed(
              const Duration(seconds: 3),
              () {
                g.Get.back();
                g.Get.offAll(() => const PaymentView());
              },
            );
          } else if (state is BookServiceAddSuccess) {
            loading = false;
            g.Get.dialog(
              const CustomeDialog(
                message: 'تم الحجز بنجاح بانتظار إتمام عملية الدفع',
                image: AppImages.confirmsvg,
              ),
              barrierDismissible: false,
              barrierColor: const Color(0xffFFFDFD),
            );
            Future.delayed(
              const Duration(seconds: 3),
              () {
                g.Get.back();
                g.Get.offAll(() => const PaymentView());
              },
            );
          }
        },
        builder: (context, index) {
          return ModalProgressHUD(
            inAsyncCall: loading,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  const Expanded(
                    child: CustomeServiceBar(title: "تأكيد الحجز"),
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimaryColor,
                              ),
                              child: CachedNetworkImage(
                                  imageUrl: '${booked!.service!.photo}',
                                  placeholder: (context, url) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                      size: 45,
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .65,
                              child: ConfirmedBooked(booked: booked!),
                            ),
                          ],
                        ),
                        const AddNotesBook(),
                      ],
                    ),
                  ),
                  CustomButton(
                    title: 'تأكيد الحجز',
                    onTap: () {
                      var description =
                          BlocProvider.of<BookServiceCubit>(context)
                              .description
                              ?.text;
                      Future.delayed(
                        const Duration(microseconds: 250),
                        () {
                          BlocProvider.of<BookServiceCubit>(context)
                              .addBookedServices(
                            body: {
                              'expert_id': booked!.expertId!,
                              'service_id': booked!.serviceId!,
                              'delivery_time': booked!.deliveryTime!,
                              'delivery_date': booked!.deliveryDate!,
                              'location': booked!.location!,
                              'description': description ?? '',
                            },
                          );
                        },
                      );
                    },
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
