// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part '../../../generated/domain/models/api/room_api_model.g.dart';

@JsonSerializable()
class RoomsApiModel {
  List<RoomApiModel> rooms;

  RoomsApiModel({required this.rooms});

  factory RoomsApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsApiModelToJson(this);
}

@JsonSerializable()
class RoomApiModel {
  int id;
  String name;
  int price;
  String price_per;
  List<String> peculiarities;
  List<String> image_urls;

  RoomApiModel({
    required this.id,
    required this.name,
    required this.price,
    required this.price_per,
    required this.peculiarities,
    required this.image_urls,
  });

  factory RoomApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoomApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomApiModelToJson(this);
}
