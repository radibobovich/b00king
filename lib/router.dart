import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/repositories/room_repository.dart';
import 'package:booking/presentation/cubit/rooms_cubit.dart';
import 'package:booking/presentation/screens/hotel_screen.dart';
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
    // case '/booking':
    //   return MaterialPageRoute(builder: (_) => const BookingScreen());
    default:
      return MaterialPageRoute(builder: (_) => const HotelScreen());
  }
}
