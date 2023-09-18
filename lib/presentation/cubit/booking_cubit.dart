import 'package:booking/domain/models/booking.dart';
import 'package:booking/domain/models/booking_form.dart';
import 'package:booking/domain/models/repositories/booking_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(
      {required BookingRepository bookingRepository,
      required this.bookingFormManager})
      : _bookingRepository = bookingRepository,
        super(BookingInitial());

  final BookingRepository _bookingRepository;
  final BookingFormManager bookingFormManager;
  late Booking _booking;

  void getBooking() async {
    try {
      _booking = await _bookingRepository.getBooking();
      emit(BookingLoaded(
          booking: _booking, touristsInfo: bookingFormManager.touristsInfo));
    } catch (e) {
      emit(BookingError(e as Exception));
    }
  }

  void addNewTourist() async {
    bookingFormManager.addTouristInfo(TouristInfo());
    emit(BookingLoaded(
        booking: _booking, touristsInfo: bookingFormManager.touristsInfo));
  }

  bool validateForms(List<GlobalKey<FormState>> keys) {
    return _validateAll(keys) && _validateTouristsEmptyFields();
  }

  bool _validateTouristsEmptyFields() {
    return bookingFormManager.validateTouristsEmptyFields();
  }

  bool _validateAll(List<GlobalKey<FormState>> keys) {
    bool isValid = true;
    for (var key in keys) {
      if (!key.currentState!.validate()) {
        isValid = false;
      }
    }
    return isValid;
  }
}

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final Booking booking;
  final List<TouristInfo> touristsInfo;
  BookingLoaded({required this.booking, required this.touristsInfo});
}

class BookingError extends BookingState {
  final Exception exception;

  BookingError(this.exception);
}
