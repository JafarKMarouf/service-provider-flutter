import 'package:flutter/material.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';

class AdditionServiceInfoBook extends StatelessWidget {
  const AdditionServiceInfoBook({super.key, required this.data});
  final ServiceDatum data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'رسوم الفحص: ${data.expert!.first.price} ل.س',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins SemiBold',
            color: Color(0xff252525),
          ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Text(
          'الوصف : ${data.serviceDescription}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
