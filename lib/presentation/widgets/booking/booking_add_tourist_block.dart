import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/booking_cubit.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTouristBlock extends StatelessWidget {
  const AddTouristBlock({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(17, 16, 17, 14),
      margin: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Добавить туриста',
            style: AppFonts.touristLabel,
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: context.color.addressColor,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 24,
                onPressed: () async {
                  context.read<BookingCubit>().addNewTourist();
                  await Future.delayed(const Duration(milliseconds: 100));
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent - 100,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
