import 'package:booking/domain/models/api/hotel_api_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../domain/models/api/booking_api_model.dart';
import '../domain/models/api/room_api_model.dart';

part '../generated/data/rest_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/3deafbe9-7e30-4bcb-9155-a17062aa302f')
  Future<HotelApiModel> getHotel();

  @GET('/c1e81a8e-705b-4de8-96a8-c78467b2d3ed')
  Future<RoomsApiModel> getRooms();

  @GET('/3b8f429f-6e7d-4a4e-9799-3d79222f95c5')
  Future<BookingApiModel> getBooking();
}
