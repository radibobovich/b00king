import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/booking_form.dart';
import 'package:booking/domain/models/repositories/booking_repository.dart';
import 'package:booking/domain/models/repositories/room_repository.dart';
import 'package:booking/presentation/cubit/booking_cubit.dart';
import 'package:booking/presentation/cubit/rooms_cubit.dart';
import 'package:booking/presentation/screens/booking_screen.dart';
import 'package:booking/presentation/screens/hotel_screen.dart';
import 'package:booking/presentation/screens/paid_screen.dart';
import 'package:booking/presentation/screens/rooms_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/rooms':
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => RoomsCubit(
                  roomsRepository: RoomRemoteRepository(
                    remoteSource: RestClient(
                      Dio(),
                    ),
                  ),
                )..getRooms(),
                child: RoomsScreen(title: settings.arguments as String),
              ));
    case '/booking':
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => BookingCubit(
                  bookingRepository: BookingRemoteRepository(
                    remoteSource: RestClient(
                      Dio(),
                    ),
                  ),
                  bookingFormManager: BookingFormManager()
                    ..addTouristInfo(TouristInfo()),
                )..getBooking(),
                child: BookingScreen(
                  touristsFormKey: GlobalKey<FormState>(),
                  phoneFormKey: GlobalKey<FormState>(),
                  emailFormKey: GlobalKey<FormState>(),
                  scrollController: ScrollController(),
                ),
              ));
    case '/paid':
      return MaterialPageRoute(builder: (_) => const PaidScreen());
    default:
      return MaterialPageRoute(builder: (_) => const HotelScreen());
  }
}
