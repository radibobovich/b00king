import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.fillColor,
    this.enableErrorLabel = false,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final String? hintText;
  final Function? onChanged;
  final Color? fillColor;
  final bool enableErrorLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: fillColor ?? context.theme.scaffoldBackgroundColor,
          // color: Colors.red,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        style: AppFonts.textFieldValue,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppFonts.textFieldLabel,
          hintText: hintText,
          hintStyle: AppFonts.textFieldHint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          errorStyle: enableErrorLabel ? null : const TextStyle(height: 0),
        ),
        onChanged: (value) {
          onChanged?.call(value);
        },
      ),
    );
  }
}
