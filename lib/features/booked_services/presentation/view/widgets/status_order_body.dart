import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/service_infos.dart';

class StatusOrderBody extends StatelessWidget {
  const StatusOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 12,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomeServiceBar(title: 'حالة الطلب'),
            const SizedBox(height: 16),
            const ServiceInfos(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: 'رفض',
                  width: MediaQuery.of(context).size.width / 2.5,
                  onTap: () {},
                  color: Colors.red,
                ),
                CustomButton(
                  title: 'قبول',
                  width: MediaQuery.of(context).size.width / 2.5,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
