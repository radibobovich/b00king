import 'package:booking/domain/models/api/room_api_model.dart';

class Room {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  Room.fromApi(RoomApiModel roomApiModel)
      : id = roomApiModel.id,
        name = roomApiModel.name,
        price = roomApiModel.price,
        pricePer = roomApiModel.price_per,
        peculiarities = roomApiModel.peculiarities,
        imageUrls = roomApiModel.image_urls;
}
