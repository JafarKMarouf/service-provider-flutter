import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/widget/service_infos_body.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';

class ServiceInfosView extends StatelessWidget {
  final DatumService data;
  const ServiceInfosView({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ServiceInfosBody(data: data),
      );
}
