// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part '../../../generated/domain/models/api/hotel_api_model.g.dart';

@JsonSerializable()
class HotelApiModel {
  int id;
  String name;
  String adress;
  int minimal_price;
  String price_for_it;
  int rating;
  String rating_name;
  List<String> image_urls;
  AboutTheHotel about_the_hotel;

  HotelApiModel(
      {required this.id,
      required this.name,
      required this.adress,
      required this.minimal_price,
      required this.price_for_it,
      required this.rating,
      required this.rating_name,
      required this.image_urls,
      required this.about_the_hotel});

  factory HotelApiModel.fromJson(Map<String, dynamic> json) =>
      _$HotelApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelApiModelToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({required this.description, required this.peculiarities});

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}
