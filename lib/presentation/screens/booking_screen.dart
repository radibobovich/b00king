import 'package:booking/domain/models/booking.dart';
import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/booking_cubit.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/error_builder.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/shared/main_hotel_info.dart';
import 'package:booking/utils/declension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: 'Бронирование'),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoaded) {
            final booking = state.booking;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 17, 19),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: context.color.blockBackgroundColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: MainHotelInfo(
                        rating: booking.horating,
                        ratingName: booking.ratingName,
                        address: booking.hotelAddress),
                  ),
                  BookingInfoTable(booking: booking)
                ],
              ),
            );
          } else if (state is BookingError) {
            return ErrorPlaceholder(exception: state.exception);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BookingInfoTable extends StatelessWidget {
  const BookingInfoTable({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(17, 16, 17, 19),
        decoration: BoxDecoration(
            color: context.color.blockBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Table(
          columnWidths: const {
            0: FractionColumnWidth(0.4),
            1: FractionColumnWidth(0.6)
          },
          children: [
            // TODO: replace with actual data
            getTableRow('Вылет из', 'Санкт-Петербург'),
            getTableRow('Страна, город', booking.arrivalCountry),
            getTableRow(
                'Даты', '${booking.tourDateStart} – ${booking.tourDateStop}'),
            getTableRow('Кол-во ночей',
                '${booking.numberOfNights} ${nightsDeclension(booking.numberOfNights)}'),
            // TODO: replace with actual data
            getTableRow('Отель', 'SteigenBerger Makadi'),
            // TODO: replace with actual data
            getTableRow('Номер', 'Стандартный с видом на бассейн или сад'),
            getTableRow('Питание', booking.nutrition, isLast: true),
          ],
        ));
  }

  TableRow getTableRow(String infoName, String infoValue,
      {bool isLast = false}) {
    final padding =
        isLast ? EdgeInsets.zero : const EdgeInsets.only(bottom: 18.25);
    return TableRow(children: [
      Padding(
        padding: padding,
        child: Text(
          infoName,
          style: AppFonts.bookingInfoName,
        ),
      ),
      Padding(
        padding: padding,
        child: Text(infoValue, style: AppFonts.bookingInfoValue),
      ),
    ]);
  }
}
