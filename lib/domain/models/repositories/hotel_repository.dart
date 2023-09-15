import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/hotel.dart';
import 'package:booking/exceptions.dart';
import 'package:dio/dio.dart';

abstract class HotelRepository {
  Future<Hotel> getHotel();
}

class HotelRemoteRepository implements HotelRepository {
  HotelRemoteRepository({required this.remoteSource});

  final RestClient remoteSource;

  @override
  Future<Hotel> getHotel() async {
    late final Hotel hotel;
    await remoteSource.getHotel().then((hotelApiModel) {
      hotel = Hotel.fromApi(hotelApiModel);
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioException:
          final res = (obj as DioException).response;
          if (res?.statusCode == 404) {
            throw NotFoundException('Hotel not found');
          } else if (res?.statusCode == 500) {
            throw ServerException('Server error');
          } else {
            throw Exception('Unknown Dio error');
          }
        default:
          throw Exception('Unknown error');
      }
    });
    return hotel;
  }
}
