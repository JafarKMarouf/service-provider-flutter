import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/freelancer_infos_view.dart';
import 'package:freelancer_app/features/payment/presentation/view/payment_view.dart';
import 'package:get/get.dart' as g;

class CustomeBookServiceInfo extends StatelessWidget {
  final DatumBooked data;
  const CustomeBookServiceInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int rating = data.expert!.rating!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              g.Get.to(
                () => FreelancerInfosView(freelanceInfos: data.expert!),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
            child: Text(
              'اسم الفريلانسر :  ${data.expert!.user!.name}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: List.generate(
                  rating,
                  (index) => const Icon(
                    Icons.star,
                    color: Color(0xffFFD541),
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  5 - rating,
                  (index) =>
                      const Icon(Icons.star_border, color: kPrimaryColor),
                ),
              ),
              const Text(
                'التقييم :   ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'تاريخ الحجز :  ${data.deliveryDate}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Text(
            'رسوم الخدمة :'
            ' ${data.expert!.price} ل.س',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          data.description != null
              ? Text(
                  'الوصف :   ${data.description}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                )
              : const SizedBox(),
          const SizedBox(height: 8),
          data.description != null
              ? Text(
                  'الوصف :   ${data.description}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                )
              : const SizedBox(),
          data.status != 'process'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        g.Get.to(
                          () => PaymentView(booked: data),
                        );
                      },
                      child: SvgPicture.asset(
                        AppImages.payment,
                        height: 34,
                        colorFilter: const ColorFilter.mode(
                          kPrimaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4,
                    ),
                    const Text(
                      'هذه الخدمة بحاجة إالى دفع الرسوم',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
