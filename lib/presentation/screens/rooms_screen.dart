import 'package:booking/domain/models/room.dart';
import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/rooms_cubit.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/theme.dart';
import 'package:booking/presentation/widgets/error_builder.dart';
import 'package:booking/presentation/widgets/shared/app_bar.dart';
import 'package:booking/presentation/widgets/shared/image_carousel.dart';
import 'package:booking/presentation/widgets/shared/peculiarities.dart';
import 'package:booking/utils/price_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SharedAppBar(title: title),
        body: BlocBuilder<RoomsCubit, RoomsState>(
          builder: (context, state) {
            if (state is RoomsLoaded) {
              final rooms = state.rooms;
              return ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) => RoomBlock(room: rooms[index]),
              );
            } else if (state is RoomsError) {
              return ErrorPlaceholder(exception: state.exception);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class RoomBlock extends StatelessWidget {
  const RoomBlock({super.key, required this.room});
  final Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imageUrls: room.imageUrls),
            // TODO: replace with actual data
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Стандартный с видом на бассейн или сад',
                style: AppFonts.roomName,
              ),
            ),

            // TODO: replace with actual data
            const Peculiarities(peculiarities: ['Все включено', 'Кондиционер']),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: MoreInfoButton(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: PriceRow(
                price: room.price,
                pricePer: room.pricePer,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Center(
                child: SelectRoomButton(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectRoomButton extends StatelessWidget {
  const SelectRoomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.adaptiveWidth * 0.92,
      height: 51,
      child: CupertinoButton(
          color: AppTheme.appColors.addressColor,
          borderRadius: BorderRadius.circular(15),
          onPressed: () => Navigator.of(context).pushNamed('/booking'),
          child: Text(
            'Выбрать номер',
            style: AppFonts.buttonLabel,
          )),
    );
  }
}

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: context.color.anyRatingBackgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Подробнее о номере ',
              style:
                  AppFonts.ratingLabel(color: context.color.anyRatingTextColor),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: context.color.anyRatingTextColor,
            )
          ],
        ),
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.price, required this.pricePer});
  final int price;
  final String pricePer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${formatPrice(price)} ₽',
          style: AppFonts.price,
        ),
        // const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Text(
            pricePer.toLowerCase(),
            style: AppFonts.priceForItLabel,
          ),
        )
      ],
    );
  }
}
