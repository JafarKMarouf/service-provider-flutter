import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';
import 'package:intl/intl.dart';

import '../../../../view_models/pick_book_service_infos_cubit/pick_book_service_infos_state.dart';

class ServiceInfosBook extends StatelessWidget {
  const ServiceInfosBook({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PickBookServiceInfosCubit>(context);
    bool loading = false;
    return BlocBuilder<PickBookServiceInfosCubit, PickBookServiceInfosState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeInfosServiceItems(
              date: cubit.newDate != null
                  ? DateFormat('dd/MM/yyy').format(cubit.newDate!)
                  : 'احجز تاريخاً للخدمة',
              onPressedDate: () async => await cubit.pickDate(context),
              dateTapped: cubit.newDate != null ? true : false,
              // ============================
              time: cubit.newTime != null
                  ? cubit.newTime!.format(context)
                  : 'اختيار الوقت',
              onPressedTime: () async => await cubit.pickTime(context),
              timeTapped: cubit.newTime != null ? true : false,
              // =================================
              location: cubit.currentAddress == null
                  ? 'تحديد الموقع'
                  : cubit.currentAddress.toString(),
              locationTapped: cubit.currentAddress != null ? true : false,
              onPressedLocation: () async {
                loading = true;
                await cubit.pickLocation();
                loading = false;
              },
            ),
            loading ? const CircularProgressIndicator() : Container(),
          ],
        );
      },
    );
  }
}
