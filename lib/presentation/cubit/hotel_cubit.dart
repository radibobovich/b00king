import 'package:booking/domain/models/hotel.dart';
import 'package:booking/domain/models/repositories/hotel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCubit extends Cubit<HotelState> {
  final HotelRepository hotelRepository;
  HotelCubit({required this.hotelRepository}) : super(HotelInitial());

  Future<void> getHotel() async {
    try {
      final Hotel hotel = await hotelRepository.getHotel();
      emit(HotelLoaded(hotel));
    } catch (e) {
      emit(HotelError(e as Exception));
    }
  }
}

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoaded extends HotelState {
  final Hotel hotel;

  HotelLoaded(this.hotel);
}

class HotelError extends HotelState {
  final Exception exception;

  HotelError(this.exception);
}
