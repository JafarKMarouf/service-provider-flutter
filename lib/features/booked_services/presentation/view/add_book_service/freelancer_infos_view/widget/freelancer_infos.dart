import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/expert.dart'
    as books;
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/rating_freelancer.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_expert.dart'
    as service;

class FreelancerInfos extends StatelessWidget {
  final books.Expert? freelanceInfos;
  final service.ServiceExpert? expert;

  const FreelancerInfos({
    super.key,
    this.expert,
    this.freelanceInfos,
  });

  @override
  Widget build(BuildContext context) {
    int rating = 0;
    if (freelanceInfos != null) {
      rating = freelanceInfos!.rating!;
    } else if (expert != null) {
      rating = expert!.rating!;
    } else {
      rating = 0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Center(
          child: CustomeFreelancerImage(
            height: 90,
            width: 90,
            image: '${freelanceInfos?.photo ?? expert?.photo}',
          ),
        ),
        const Expanded(child: SizedBox()),
        Text(
          'الاسم :  '
          '${freelanceInfos?.user!.name ?? expert?.user!.name}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'رقم الموبايل :   '
          '${freelanceInfos?.mobile ?? expert?.mobile}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'المنطقة :   '
          '${freelanceInfos?.country ?? expert?.country}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'سعر الخدمة : '
          '${freelanceInfos?.price ?? expert?.price} '
          'ل.س',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'عدد ساعات العمل :   '
          '${freelanceInfos?.workHours ?? expert?.workingHours} '
          'ساعة/ساعات',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'الوصف :   '
          '${freelanceInfos?.description ?? expert?.description} ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RatingFreelancer(rating: rating, size: 24),
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
      ],
    );
  }
}
