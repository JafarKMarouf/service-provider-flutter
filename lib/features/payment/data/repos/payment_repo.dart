import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/payment/data/models/payment/payment.dart';

abstract class PaymentRepo {
  Future<Either<Failure, Payment>> fetchAllPayments();

  Future<Either<Failure, Payment>> addPayment({
    required Map<String, dynamic> body,
  });
}
