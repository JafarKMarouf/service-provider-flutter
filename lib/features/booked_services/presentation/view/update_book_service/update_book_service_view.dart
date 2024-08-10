import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';

import '../../../../../core/widgets/custome_service_bar.dart';
import '../add_book_service/service_infos_view/widget/service_infos_book.dart';

class UpdateBookServiceView extends StatelessWidget {
  const UpdateBookServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        child: Column(
          children: [
            const Expanded(child: CustomeServiceBar(title: "تعديل حجز الخدمة")),
            //  Expanded(flex: 2, child: ServiceType(data: data)),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) => PickBookServiceInfosCubit(),
              // child: const Expanded(child: ServiceInfosBook()),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
