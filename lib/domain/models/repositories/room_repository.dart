import 'package:booking/data/rest_client.dart';
import 'package:booking/domain/models/api/room_api_model.dart';
import 'package:booking/domain/models/room.dart';
import 'package:booking/exceptions.dart';
import 'package:dio/dio.dart';

abstract class RoomRepository {
  Future<List<Room>> getRooms();
  Future<Room> getRoomById(int id);
}

class RoomRemoteRepository implements RoomRepository {
  RoomRemoteRepository({required this.remoteSource});

  final RestClient remoteSource;

  @override
  Future<List<Room>> getRooms() async {
    late final RoomsApiModel roomsApiModel;
    await remoteSource.getRooms().then((data) {
      roomsApiModel = data;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioException:
          final res = (obj as DioException).response;
          if (res?.statusCode == 404) {
            throw NotFoundException('Rooms not found');
          } else if (res?.statusCode == 500) {
            throw ServerException('Server error');
          } else {
            throw Exception('Unknown Dio error');
          }
        default:
          throw Exception('Unknown error');
      }
    });

    return roomsApiModel.rooms.map((room) => Room.fromApi(room)).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
  }

  @override
  Future<Room> getRoomById(int id) async {
    final rooms = await getRooms();
    final room = rooms.firstWhere((room) => room.id == id);
    return room;
  }
}
