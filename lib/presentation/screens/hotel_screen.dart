import 'package:booking/presentation/cubit/hotel_cubit.dart';
import 'package:booking/presentation/widgets/error_builder.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/hotel/hotel_bottom_block.dart';
import 'package:booking/presentation/widgets/hotel/hotel_top_block.dart';
import 'package:booking/presentation/widgets/shared/bottom_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:core';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SharedAppBar(title: 'Отель'),
        bottomSheet: BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is! HotelLoaded) {
              return const SizedBox.shrink();
            }
            return BottomButtonSheet(
              buttonText: 'К выбору номера',
              onPressed: () => Navigator.pushNamed(
                context,
                '/rooms',
                arguments: state.hotel.name,
              ),
            );
          },
        ),
        body: BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is HotelLoaded) {
              final hotel = state.hotel;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// White block with gallery and main info
                    TopBlock(hotel: hotel),
                    const SizedBox(height: 7.5),
                    BottomBlock(hotel: hotel),
                    const SizedBox(height: 82),
                  ],
                ),
              );
            } else if (state is HotelError) {
              return ErrorPlaceholder(exception: state.exception);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
