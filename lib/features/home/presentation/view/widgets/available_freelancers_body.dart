import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';

import 'package:freelancer_app/features/home/presentation/view/widgets/custome_freelancer_image.dart';

class AvailableFreelancerBody extends StatelessWidget {
  const AvailableFreelancerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomeSearchArrowBackBar(),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'الفريلانسر المتاحين',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const CustomeInfosServiceItems(
            date: '12/05/2024',
            time: '2-3 وقت الظهيرة',
            location: 'طرطوس',
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Future.delayed(
                      const Duration(microseconds: 250),
                      () {
                        // g.Get.to(
                        //   () => FreelancerInfosView(),
                        //   transition: g.Transition.fadeIn,
                        //   duration: kDurationTransition,
                        // );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: CustomeFreelancerImage(
                            image:
                                'http://192.168.194.128:8000/storage/experts/1715082626.png',
                            height: 80,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomeText(
                              text: 'هشام',
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                            CustomeText(
                              text: '9000 ل.س',
                              size: 14,
                              weight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
