import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/freelancer_infos_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/rating_freelancer.dart';
import 'package:get/get.dart' as g;
import 'package:freelancer_app/features/main/data/models/service_model/service_expert.dart';

class CustomeFreelancerItem extends StatelessWidget {
  final ServiceExpert expert;

  const CustomeFreelancerItem({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(
          const Duration(microseconds: 250),
          () {
            g.Get.to(
              () => FreelancerInfosView(expert: expert),
              transition: g.Transition.fadeIn,
              duration: kDurationTransition,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomeFreelancerImage(
                image: '${expert.photo}',
                height: 75,
              ),
            ),
            Column(
              children: [
                CustomeText(
                  text: expert.user!.name!,
                  size: 12,
                  weight: FontWeight.w600,
                ),
                RatingFreelancer(rating: expert.rating!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
