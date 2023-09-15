import 'api/hotel_api_model.dart';

class Hotel {
  int id;
  String name;
  String address;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
  Hotel.fromApi(HotelApiModel hotelApiModel)
      : id = hotelApiModel.id,
        name = hotelApiModel.name,
        address = hotelApiModel.adress,
        minimalPrice = hotelApiModel.minimal_price,
        priceForIt = hotelApiModel.price_for_it,
        rating = hotelApiModel.rating,
        ratingName = hotelApiModel.rating_name,
        imageUrls = hotelApiModel.image_urls,
        aboutTheHotel = hotelApiModel.about_the_hotel;
}
