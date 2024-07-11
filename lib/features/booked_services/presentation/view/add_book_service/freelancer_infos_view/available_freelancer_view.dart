import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/available_freelancers_body.dart';

class AvailableFreelancerView extends StatelessWidget {
  const AvailableFreelancerView({
    super.key,
    required this.date,
    required this.time,
    required this.location,
  });
  final String date;
  final String time;
  final String location;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AvailableFreelancerBody(
          date: date,
          time: time,
          location: location,
        ),
      );
}
