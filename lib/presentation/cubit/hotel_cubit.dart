import 'package:booking/domain/models/hotel.dart';
import 'package:booking/domain/models/repositories/hotel_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCubit extends Cubit<HotelState> {
  final HotelRepository hotelRepository;
  HotelCubit({required this.hotelRepository}) : super(HotelInitial());

  Future<Hotel?> getHotel() async {
    try {
      final Hotel hotel = await hotelRepository.getHotel();
      return hotel;
    } catch (e) {
      emit(HotelError(e as Exception));
      return null;
    }
  }

  Future<void> displayHotel(Hotel hotel) async {
    emit(HotelLoaded(hotel));
  }
}

Future<void> precacheGallery(
    List<String> imageUrls, BuildContext context) async {
  for (var img in imageUrls) {
    await precacheImage(NetworkImage(img), context);
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
