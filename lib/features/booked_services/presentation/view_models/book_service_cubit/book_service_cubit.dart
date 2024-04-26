import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/book_service.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  BookServiceCubit(this.bookServiceRepoImpl) : super(BookServiceInitial());

  final BookServiceRepoImpl bookServiceRepoImpl;

  Future<void> fetchBookServices() async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.fetchAllBookServices();

    result.fold((fail) {
      emit(
        BookServiceFailure(
          errMessage: fail.errMessage,
        ),
      );
    }, (bookService) {
      emit(
        BookServiceSuccess(
          bookService: bookService,
        ),
      );
    });
  }
}
