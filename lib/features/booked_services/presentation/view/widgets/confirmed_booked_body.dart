import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';

class ConfirmedBookedBody extends StatelessWidget {
  const ConfirmedBookedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        children: [
          const AspectRatio(aspectRatio: 17),
          const CustomeServiceBar(title: "حالة الطلب"),
          const SizedBox(height: 50),
          // const ConfirmedBooked(),
          const Spacer(),
          CustomButton(
            title: 'حسناً',
            onTap: () {},
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
