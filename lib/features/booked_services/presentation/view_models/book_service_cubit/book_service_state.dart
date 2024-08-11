part of 'book_service_cubit.dart';

sealed class BookServiceState extends Equatable {
  const BookServiceState();

  @override
  List<Object> get props => [];
}

final class BookServiceInitial extends BookServiceState {}

final class BookServiceLoading extends BookServiceState {}

final class BookServiceFailure extends BookServiceState {
  final String errMessage;
  const BookServiceFailure({required this.errMessage});
}

final class BookServiceSuccess extends BookServiceState {
  final BookServices bookService;

  const BookServiceSuccess({required this.bookService});
}

final class BookServiceAddSuccess extends BookServiceState {
  final DatumBooked bookService;
  const BookServiceAddSuccess({required this.bookService});
}

final class BookServicePickDateInitial extends BookServiceState {}

final class BookServicePickDateUpdated extends BookServiceState {}

final class BookServicePickDateFailure extends BookServiceState {}

final class BookServicePickTimeInitial extends BookServiceState {}

final class BookServicePickTimeUpdated extends BookServiceState {}

final class BookServicePickTimeFailure extends BookServiceState {}

final class BookServicePickLocationLoading extends BookServiceState {}

final class BookServicePickLocationUpdated extends BookServiceState {}

final class BookServicePickLocationFailure extends BookServiceState {}

final class BookServiceDeleteLoading extends BookServiceState {}

final class BookServiceDeleteSuccess extends BookServiceState {
  final Map<String, dynamic> successMessage;
  const BookServiceDeleteSuccess({required this.successMessage});
}

final class BookServiceDeleteFailure extends BookServiceState {
  final String errMessage;
  const BookServiceDeleteFailure({required this.errMessage});
}
