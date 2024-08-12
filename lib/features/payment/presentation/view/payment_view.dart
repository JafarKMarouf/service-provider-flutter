import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/payment/data/repos/payment_repo_impl.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_body.dart';
import 'package:freelancer_app/features/payment/presentation/view/widgets/payment_form.dart';
import 'package:freelancer_app/features/payment/presentation/view_models/payment_cubit.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.booked});
  final DatumBooked? booked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaymentCubit(PaymentRepoImpl(ApiService(Dio()))),
        child: PaymentBody(booked: booked),
      ),
    );
  }
}
