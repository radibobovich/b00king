import 'dart:io';

import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/repositories/hotel_repository.dart';
import 'package:booking/presentation/cubit/hotel_cubit.dart';
import 'package:booking/presentation/screens/hotel_screen.dart';
import 'package:booking/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.mainTheme,
      home: BlocProvider(
        create: (context) => HotelCubit(
          hotelRepository: HotelRemoteRepository(
            remoteSource: RestClient(
              Dio(),
            ),
          ),
        ),
        child: const HotelScreen(),
      ),
    );
  }
}
