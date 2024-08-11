import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/payment/data/models/payment/payment.dart';
import 'package:freelancer_app/features/payment/data/repos/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  ApiService apiService;
  PaymentRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, Payment>> addPayment({
    required Map<String, dynamic> body,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: 'customer/payment',
        body: body,
      );
      return right(Payment.fromMap(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Payment>> fetchAllPayments() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Payment>> updatePayment({required int id}) {
    throw UnimplementedError();
  }
}
