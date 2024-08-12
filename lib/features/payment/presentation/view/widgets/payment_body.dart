import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_dialog.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_form.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key, required this.booked});
  final DatumBooked? booked;

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentLoading) {
          loading = true;
        } else if (state is PaymentFailure) {
          loading = false;
          Get.dialog(
            CustomeDialog(
              message: state.errMessage,
              image: AppImages.sadsvg,
            ),
            barrierDismissible: false,
            barrierColor: const Color(0xffFFFDFD),
          );
          Future.delayed(
            const Duration(seconds: 3),
            () => Get.back(),
          );
        } else if (state is PaymentSuccess) {
          loading = false;
          Get.dialog(
            const CustomeDialog(
              message: 'تم الدفع بنجاح',
              image: AppImages.confirmsvg,
            ),
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
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.only(left: 14, bottom: 24, right: 14),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AspectRatio(aspectRatio: 12),
                  const CustomeServiceBar(title: 'عملية الدفع'),
                  const AspectRatio(aspectRatio: 12),
                  CustomeText(
                    text:
                        'قم بدفع رسوم الخدمة التي قمت بحجزها إلى حساب التاجر الدفع اليدوي:'
                        '${booked!.expert!.mobile}'
                        ' ثم اكتب رقم عملية التحويل '
                        '\n\n💡لا تُقبل عمليات تحويل الرصيد (وحدات)، سيرتيل كاش حصراً.',
                    size: 16,
                    weight: FontWeight.w800,
                  ),
                  const AspectRatio(aspectRatio: 12),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .8,
                    child: PaymentForm(
                      bookServiceId: booked!.id!,
                      expertId: booked!.expert!.userId!,
                    ),
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
