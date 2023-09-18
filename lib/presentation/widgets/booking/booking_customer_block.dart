import 'package:booking/extensions.dart';
import 'package:booking/presentation/cubit/booking_cubit.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/booking/booking_custom_field.dart';
import 'package:booking/presentation/widgets/booking/booking_phone_entry.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBlock extends StatelessWidget {
  const CustomerBlock({
    super.key,
    required this.phoneFormKey,
    required this.emailFormKey,
  });
  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(17, 16, 17, 17),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text('Информация о покупателе',
                style: AppFonts.customerInfoHeader),
          ),
          PhoneEntry(
            controller: cubit.bookingFormManager.phoneNumberController,
            formKey: phoneFormKey,
          ),
          const SizedBox(height: 7),
          EmailEntry(emailFormKey: emailFormKey),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                style: AppFonts.customerInfoHint),
          ),
        ],
      ),
    );
  }
}

class EmailEntry extends StatefulWidget {
  const EmailEntry({super.key, required this.emailFormKey});
  final GlobalKey<FormState> emailFormKey;

  @override
  State<EmailEntry> createState() => _EmailEntryState();
}

class _EmailEntryState extends State<EmailEntry> {
  Color? emailFillColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.emailFormKey,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            widget.emailFormKey.currentState?.validate();
          }
        },
        child: CustomField(
            controller:
                context.read<BookingCubit>().bookingFormManager.emailController,
            labelText: 'Email',
            hintText: 'Введите email',
            keyboardType: TextInputType.emailAddress,
            fillColor: emailFillColor,
            validator: (value) {
              if (!EmailValidator.validate(value ?? '', false, false)) {
                setState(() {
                  emailFillColor = context.color.formErrorColor;
                });
              } else {
                setState(() {
                  emailFillColor = context.theme.scaffoldBackgroundColor;
                });
              }
              return null;
            }),
      ),
    );
  }
}
