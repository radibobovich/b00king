import 'package:booking/domain/models/api/hotel_api_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../domain/models/api/booking_api_model.dart';
import '../domain/models/api/room_api_model.dart';

part '../generated/data/rest_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelApiModel> getHotel();

  @GET('/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<RoomsApiModel> getRooms();

  @GET('/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<BookingApiModel> getBooking();
}
