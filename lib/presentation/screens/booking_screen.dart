import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/booking_cubit.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/booking/booking_add_tourist_block.dart';
import 'package:booking/presentation/widgets/booking/booking_customer_block.dart';
import 'package:booking/presentation/widgets/booking/booking_tables.dart';
import 'package:booking/presentation/widgets/booking/booking_tourist_block.dart';
import 'package:booking/presentation/widgets/error_builder.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/shared/bottom_button_sheet.dart';
import 'package:booking/presentation/widgets/shared/main_hotel_info.dart';
import 'package:booking/utils/price_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen(
      {super.key,
      required this.touristsFormKey,
      required this.phoneFormKey,
      required this.emailFormKey,
      required this.scrollController});
  final GlobalKey<FormState> touristsFormKey;
  final ScrollController scrollController;
  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(title: 'Бронирование'),
      bottomSheet: BookingBottomSheet(
          phoneFormKey: phoneFormKey,
          emailFormKey: emailFormKey,
          touristsFormKey: touristsFormKey),
      body: BookingBody(
          scrollController: scrollController,
          phoneFormKey: phoneFormKey,
          emailFormKey: emailFormKey,
          touristsFormKey: touristsFormKey),
    );
  }
}

class BookingBody extends StatelessWidget {
  const BookingBody({
    super.key,
    required this.scrollController,
    required this.phoneFormKey,
    required this.emailFormKey,
    required this.touristsFormKey,
  });

  final ScrollController scrollController;
  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> touristsFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoaded) {
          final booking = state.booking;
          final tourists = state.touristsInfo;
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(17, 0, 17, 19),
                  margin: const EdgeInsets.only(top: 10, bottom: 8),
                  decoration: BoxDecoration(
                      color: context.color.blockBackgroundColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: MainHotelInfo(
                      rating: booking.horating,
                      ratingName: booking.ratingName,
                      hotelName: booking.hotelName,
                      address: booking.hotelAddress),
                ),
                BookingInfoTable(booking: booking),
                CustomerBlock(
                  phoneFormKey: phoneFormKey,
                  emailFormKey: emailFormKey,
                ),
                Form(
                    key: touristsFormKey,
                    child: Column(
                      children: List.generate(
                        tourists.length,
                        (index) => TouristBlock(
                            touristInfo: tourists[index], id: index + 1),
                      ),
                    )),
                AddTouristBlock(scrollController: scrollController),
                PricingTable(booking: booking),
                const SizedBox(height: 82),
              ],
            ),
          );
        } else if (state is BookingError) {
          return ErrorPlaceholder(exception: state.exception);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({
    super.key,
    required this.phoneFormKey,
    required this.emailFormKey,
    required this.touristsFormKey,
  });

  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> touristsFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoaded) {
          final totalPrice = state.booking.tourPrice +
              state.booking.fuelCharge +
              state.booking.serviceCharge;
          return BottomButtonSheet(
            buttonText: 'Оплатить ${formatPrice(totalPrice)} ₽',
            onPressed: () {
              if (context.read<BookingCubit>().validateForms(
                  [phoneFormKey, emailFormKey, touristsFormKey])) {
                Navigator.of(context).pushNamed('/paid');
              } else {
                // snack bar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                    'Заполнены не все поля',
                    style: AppFonts.errorSnackbarLabel,
                  ),
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                ));
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
