import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/payment/data/models/payment/payment.dart';
import 'package:freelancer_app/features/payment/data/repos/payment_repo_impl.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepoImpl paymentRepoImpl;

  TextEditingController amountController = TextEditingController();
  TextEditingController amountConfirmController = TextEditingController();
  TextEditingController operationNumberController = TextEditingController();
  TextEditingController operationNumberConfirmController =
      TextEditingController();

  AutovalidateMode autoValidatePayment = AutovalidateMode.disabled;
  GlobalKey<FormState> formKeyPayment = GlobalKey();

  PaymentCubit(this.paymentRepoImpl) : super(PaymentInitial());

  Future<void> addPayment({required Map<String, dynamic> body}) async {
    emit(PaymentLoading());
    var result = await paymentRepoImpl.addPayment(body: body);

    result.fold((fail) {
      emit(PaymentFailure(errMessage: fail.errMessage));
    }, (payment) {
      emit(PaymentSuccess(payment: payment));
    });
  }
}
