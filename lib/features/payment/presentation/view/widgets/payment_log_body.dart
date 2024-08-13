import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/features/payment/data/models/payment/payment_datum.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment__log_item_loading.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_log_item_success.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';

class PaymentLogBody extends StatelessWidget {
  const PaymentLogBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PaymentCubit>(context);
    cubit.fetchPayments();

    return Container(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
        bottom: 15,
        top: 16,
      ),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentSuccess) {
            List<PaymentDatum> payments = [];
            payments.addAll(state.payment.data!.toList());
            log('=====length:${payments.length}');
            return ListView.builder(
              itemCount: payments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: AppColors.primary,
                      ),
                    ),
                    child: PaymentLogItemSuccess(payments: payments[index]),
                  ),
                );
              },
            );
          } else {
            return const PaymentLogItemLoading();
          }
        },
      ),
    );
  }
}
