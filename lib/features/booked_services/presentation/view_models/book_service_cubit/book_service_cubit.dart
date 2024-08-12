import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:geolocator/geolocator.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  int? serviceId;
  String? serviceName;
  String? photo;
  int? customerId;
  int? expertId;
  String? expertName;
  double? price;
  String? mobile;
  int? rating;
  String? deliveryTime;
  String? deliveryDate;
  String? currentAddress;
  Position? currentPosition;
  TextEditingController? description;

  final BookServiceRepoImpl bookServiceRepoImpl;
  BookServiceCubit(this.bookServiceRepoImpl) : super(BookServiceInitial());

  Future<void> fetchBookServices() async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.fetchAllBookServices();

    result.fold(
      (fail) {
        emit(BookServiceFailure(errMessage: fail.errMessage));
      },
      (bookService) {
        emit(BookServiceSuccess(bookService: bookService));
      },
    );
  }

  Future<void> addBookedServices({required Map<String, dynamic> body}) async {
    emit(BookServiceAddLoading());

    var result = await bookServiceRepoImpl.addBookService(body: body);

    result.fold(
      (fail) {
        emit(BookServiceAddFailure(errMessage: fail.errMessage));
      },
      (booked) {
        emit(BookServiceAddSuccess(bookService: booked));
      },
    );
  }

  Future<void> updateStatusBooked({required int id}) async {
    emit(BookServiceUpdateStatusLoading());

    var result = await bookServiceRepoImpl.updateStatusBookService(id: id);
    result.fold(
      (fail) {
        emit(BookServiceUpdateStatusFailure(errMessage: fail.errMessage));
      },
      (bookService) {
        emit(BookServiceUpdateStatusSuccess(bookService: bookService));
      },
    );
  }

  Future<void> deleteBookService({required int id}) async {
    emit(BookServiceDeleteLoading());
    var result = await bookServiceRepoImpl.deleteBookService(id: id);
    result.fold(
      (fail) {
        emit(BookServiceDeleteFailure(errMessage: fail.errMessage));
      },
      (booked) {
        emit(BookServiceDeleteSuccess(successMessage: booked));
      },
    );
  }
}
