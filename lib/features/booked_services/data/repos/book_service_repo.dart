import 'package:dartz/dartz.dart';
import 'package:freelancer_app/core/errors/failure.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';

abstract class BookServiceRepo {
  Future<Either<Failure, BookServices>> fetchAllBookServices();

  Future<Either<Failure, DatumBooked>> addBookService({
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, BookServices>> showOneBookService({required int id});

  Future<Either<Failure, BookServices>> updateStatusBookService(
      {required int id});

  Future<Either<Failure, Map<String, dynamic>>> deleteBookService(
      {required int id});
}
