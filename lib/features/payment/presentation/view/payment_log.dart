import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/payment/data/repos/payment_repo_impl.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_log_body.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';

class PaymentLog extends StatelessWidget {
  const PaymentLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaymentCubit(PaymentRepoImpl(ApiService(Dio()))),
        child: const PaymentLogBody(),
      ),
    );
  }
}
