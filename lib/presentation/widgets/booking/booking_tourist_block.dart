import 'package:booking/domain/models/booking_form.dart';
import 'package:booking/extensions.dart';
import 'package:booking/presentation/fonts.dart';
import 'package:booking/presentation/widgets/booking/booking_custom_field.dart';
import 'package:booking/utils/declension.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TouristBlock extends StatefulWidget {
  const TouristBlock({
    super.key,
    required this.touristInfo,
    required this.id,
  });
  final TouristInfo touristInfo;
  final int id;

  @override
  State<TouristBlock> createState() => _TouristBlockState();
}

class _TouristBlockState extends State<TouristBlock> {
  bool expanded = false;

  Color? nameFillColor;
  Color? lastNameFillColor;
  Color? dateOfBirthFillColor;
  Color? citizenshipFillColor;
  Color? passportFillColor;
  Color? passportExpirationDateFillColor;

  @override
  void initState() {
    expanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: expanded
          ? const EdgeInsets.fromLTRB(17, 14, 17, 16)
          : const EdgeInsets.fromLTRB(17, 14, 17, 5),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: TouristHeader(
                id: widget.id,
                expanded: expanded,
                onTap: () => setState(() {
                  expanded = !expanded;
                }),
              ),
            ),
            Visibility(
              maintainState: true,
              visible: expanded,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    CustomField(
                      controller: widget.touristInfo.firstNameController,
                      labelText: 'Имя',
                      fillColor: nameFillColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            nameFillColor = context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            nameFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    const SizedBox(height: 7),
                    CustomField(
                      controller: widget.touristInfo.lastNameController,
                      labelText: 'Фамилия',
                      textCapitalization: TextCapitalization.sentences,
                      fillColor: lastNameFillColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            lastNameFillColor = context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            lastNameFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomField(
                      controller: widget.touristInfo.dateOfBirthController,
                      labelText: 'Дата рождения',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '##.##.####',
                            type: MaskAutoCompletionType.eager)
                      ],
                      fillColor: dateOfBirthFillColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            dateOfBirthFillColor = context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            dateOfBirthFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomField(
                      controller: widget.touristInfo.citizenshipController,
                      labelText: 'Гражданство',
                      textCapitalization: TextCapitalization.sentences,
                      fillColor: citizenshipFillColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            citizenshipFillColor = context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            citizenshipFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomField(
                      controller: widget.touristInfo.passportController,
                      labelText: 'Номер загранпаспорта',
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '## #######',
                            type: MaskAutoCompletionType.eager),
                      ],
                      keyboardType: TextInputType.number,
                      fillColor: passportFillColor,
                      validator: (value) {
                        if (value!.length < 10) {
                          setState(() {
                            passportFillColor = context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            passportFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomField(
                      controller:
                          widget.touristInfo.passportExpirationDateController,
                      labelText: 'Срок действия загранпаспорта',
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '##.##.####',
                            type: MaskAutoCompletionType.eager)
                      ],
                      keyboardType: TextInputType.number,
                      fillColor: passportExpirationDateFillColor,
                      validator: (value) {
                        if (value!.length < 10) {
                          setState(() {
                            passportExpirationDateFillColor =
                                context.color.formErrorColor;
                          });
                          return '';
                        } else {
                          setState(() {
                            passportExpirationDateFillColor =
                                context.theme.scaffoldBackgroundColor;
                          });
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TouristHeader extends StatelessWidget {
  const TouristHeader(
      {super.key,
      required this.id,
      required this.expanded,
      required this.onTap});
  final int id;
  final bool expanded;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${touristDeclension(id)} турист', style: AppFonts.touristLabel),
        const Spacer(),
        Center(
          child: Material(
            child: InkWell(
              onTap: () => onTap(),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: context.color.anyRatingBackgroundColor,
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 32,
                    onPressed: () => onTap(),
                    icon: Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: context.color.anyRatingTextColor,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
