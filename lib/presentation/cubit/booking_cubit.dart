import 'package:booking/domain/models/booking.dart';
import 'package:booking/domain/models/repositories/booking_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({required this.bookingRepository}) : super(BookingInitial());

  final BookingRepository bookingRepository;

  void getBooking() async {
    try {
      final booking = await bookingRepository.getBooking();
      emit(BookingLoaded(booking: booking));
    } catch (e) {
      emit(BookingError(e as Exception));
    }
  }
}

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final Booking booking;

  BookingLoaded({required this.booking});
}

class BookingError extends BookingState {
  final Exception exception;

  BookingError(this.exception);
}
