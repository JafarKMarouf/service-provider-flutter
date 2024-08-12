import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/rating_freelancer.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_style_service_infos.dart';

class ConfirmedBooked extends StatelessWidget {
  final DatumBooked booked;
  const ConfirmedBooked({super.key, required this.booked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomeStyleServiceInfos(
          title: 'اسم الخدمة : ',
          info: booked.service!.serviceName,
        ),
        const SizedBox(height: 8),
        CustomeStyleServiceInfos(
          title: 'اسم الفريلانسر : ',
          info: booked.expert!.user!.name,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RatingFreelancer(rating: booked.expert!.rating!),
            const Text(
              'التقييم :   ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomeStyleServiceInfos(
          title: ' رسوم الخدمة مكتملة : ',
          info: '${booked.expert!.price} ل.س',
        ),
        const SizedBox(height: 8),
        CustomeStyleServiceInfos(
          title: 'التاريخ : ',
          info: '${booked.deliveryDate}',
        ),
        const SizedBox(height: 8),
        CustomeStyleServiceInfos(
          title: ' وقت إكمال الخدمة : ',
          info: '${booked.deliveryTime}',
        ),
        const SizedBox(height: 8),
        CustomeStyleServiceInfos(
          title: ' رفم الفريلانسر : ',
          info: '${booked.expert!.mobile}',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
