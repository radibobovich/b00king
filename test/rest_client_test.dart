import 'package:booking/data/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Get hotel from API', () async {
    final dio = Dio();
    final client = RestClient(dio);
    final hotel = await client.getHotel();
    expect(hotel.id, 1);
    expect(hotel.name, 'Лучший пятизвездочный отель в Хургаде, Египет');
  });

  test('Get rooms from API', () async {
    final dio = Dio();
    final client = RestClient(dio);
    final rooms = await client.getRooms();
    expect(rooms.rooms.first.id, 1);
    expect(rooms.rooms.length > 1, true);
  });

  test('Get booking from API', () async {
    final dio = Dio();
    final client = RestClient(dio);
    final booking = await client.getBooking();
    expect(booking.id, 1);
    expect(booking.hotel_name, 'Лучший пятизвездочный отель в Хургаде, Египет');
  });
}
