// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part '../../../generated/domain/models/api/booking_api_model.g.dart';

@JsonSerializable()
class BookingApiModel {
  int id;
  String hotel_name;
  String hotel_adress;
  int horating;
  String rating_name;
  String departure;
  String arrival_country;
  String tour_date_start;
  String tour_date_stop;
  int number_of_nights;
  String room;
  String nutrition;
  int tour_price;
  int fuel_charge;
  int service_charge;

  BookingApiModel({
    required this.id,
    required this.hotel_name,
    required this.hotel_adress,
    required this.horating,
    required this.rating_name,
    required this.departure,
    required this.arrival_country,
    required this.tour_date_start,
    required this.tour_date_stop,
    required this.number_of_nights,
    required this.room,
    required this.nutrition,
    required this.tour_price,
    required this.fuel_charge,
    required this.service_charge,
  });

  factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookingApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);
}
