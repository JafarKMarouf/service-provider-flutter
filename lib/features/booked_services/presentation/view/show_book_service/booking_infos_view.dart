import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_dialog.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/approve_service_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/widget/book_service_type.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widget/custome_book_service_infos.dart';

class BookingInfosView extends StatelessWidget {
  final DatumBooked data;

  const BookingInfosView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var formatTime = data.deliveryTime!;
    var loading = false;
    return BlocConsumer<BookServiceCubit, BookServiceState>(
      listener: (context, state) {
        if (state is BookServiceDeleteSuccess) {
          loading = false;
          Get.dialog(
            const CustomeDialog(message: ' تم الحذف نتمنى أن تجد عرضا يناسبك'),
            barrierDismissible: false,
            barrierColor: const Color(0xffFFFDFD),
          );
          Future.delayed(
            const Duration(seconds: 3),
            () {
              Get.back();
              Get.offAll(() => const CustomeNavBar());
            },
          );
        } else if (state is BookServiceDeleteFailure) {
          loading = false;
          Get.dialog(
            CustomeDialog(
              message: state.errMessage,
            ),
            barrierDismissible: false,
            barrierColor: const Color(0xffFFFDFD),
          );
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Get.back();
              Get.offAll(() => const CustomeNavBar());
            },
          );
        } else {
          loading = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: loading,
            child: Container(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  const AspectRatio(aspectRatio: 17),
                  const CustomeServiceBar(title: "معلومات الحجز"),
                  Expanded(flex: 2, child: BookServiceType(data: data)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: CustomeInfosServiceItems(
                      location: data.location,
                      phone: data.expert!.mobile,
                      time: formatTime,
                      timeTapped: true,
                      locationTapped: true,
                      phoneTapped: true,
                    ),
                  ),
                  Expanded(flex: 2, child: CustomeBookServiceInfo(data: data)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        title: 'حذف حجز الخدمة',
                        width: MediaQuery.of(context).size.width / 2.5,
                        onTap: () async {
                          await BlocProvider.of<BookServiceCubit>(context)
                              .deleteBookService(id: data.id!);
                        },
                        color: Colors.red,
                      ),
                      CustomButton(
                        title: 'تعديل الحجز',
                        width: MediaQuery.of(context).size.width / 2.5,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
