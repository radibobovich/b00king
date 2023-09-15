import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/repositories/hotel_repository.dart';
import 'package:booking/presentation/cubit/hotel_cubit.dart';
import 'package:booking/presentation/screens/hotel_screen.dart';
import 'package:booking/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.mainTheme,
      home: BlocProvider(
        create: (context) => HotelCubit(
          hotelRepository: HotelRemoteRepository(
            remoteSource: RestClient(
              Dio(),
            ),
          ),
        )..getHotel(),
        child: const HotelScreen(),
      ),
    );
  }
}
