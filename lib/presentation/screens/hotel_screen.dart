import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/hotel_cubit.dart';
import 'package:booking/presentation/widgets/error_builder.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/hotel/hotel_bottom_block.dart';
import 'package:booking/presentation/widgets/hotel/hotel_top_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:core';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  /// Pre-cache images so bloc will emit state only after images are loaded
  /// This will prolong loading time, but also prevent flickering
  @override
  void didChangeDependencies() {
    final cubit = context.read<HotelCubit>();
    cubit.getHotel().then((hotel) async {
      if (hotel != null) {
        await precacheGallery(hotel.imageUrls, context);
      }
      return hotel;
    }).then((value) {
      if (value != null) {
        cubit.displayHotel(value);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HotelAppBar(title: 'Отель'),
        bottomSheet: const BottomButtonSheet(),
        body: SingleChildScrollView(
          child: BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state is HotelLoaded) {
                final hotel = state.hotel;
                return Column(
                  children: [
                    /// White block with gallery and main info
                    TopBlock(hotel: hotel),
                    const SizedBox(height: 7.5),
                    BottomBlock(hotel: hotel),
                    const SizedBox(height: 82),
                  ],
                );
              } else if (state is HotelError) {
                return ErrorPlaceholder(exception: state.exception);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}

class BottomButtonSheet extends StatelessWidget {
  const BottomButtonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is! HotelLoaded) {
          return const SizedBox.shrink();
        }
        return Stack(alignment: Alignment.topCenter, children: [
          Container(
            color: context.theme.primaryColor,
            width: context.adaptiveWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 9),
              child: CupertinoButton(
                  borderRadius: BorderRadius.circular(15),
                  color: context.color.addressColor,
                  child: const Text(
                    'К выбору номера',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {}),
            ),
          ),
          const Divider(
            thickness: 1.5,
            height: 1,
          )
        ]);
      },
    );
  }
}
