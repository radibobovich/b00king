import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/booking.dart';
import 'package:booking/exceptions.dart';
import 'package:dio/dio.dart';

abstract class BookingRepository {
  Future<Booking> getBooking();
}

class BookingRemoteRepository implements BookingRepository {
  BookingRemoteRepository({required this.remoteSource});

  final RestClient remoteSource;

  @override
  Future<Booking> getBooking() async {
    late final Booking booking;
    await remoteSource.getBooking().then((bookingApiModel) {
      booking = Booking.fromApi(bookingApiModel);
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioException:
          final res = (obj as DioException).response;
          if (res?.statusCode == 404) {
            throw NotFoundException('Booking not found');
          } else if (res?.statusCode == 500) {
            throw ServerException('Server error');
          } else {
            throw Exception('Unknown Dio error');
          }
        default:
          throw Exception('Unknown error');
      }
    });
    return booking;
  }
}
