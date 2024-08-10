import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/freelancer_infos_view.dart';
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
            'رسوم الخدمة :  \$ ${data.expert!.price} ',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          // const SizedBox(height: 8),
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
        ],
      ),
    );
  }
}
