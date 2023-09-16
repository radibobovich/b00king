import 'package:booking/domain/models/repositories/room_repository.dart';
import 'package:booking/domain/models/room.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit({required this.roomsRepository}) : super(RoomsInitial());

  final RoomRepository roomsRepository;

  Future<void> getRooms() async {
    try {
      final rooms = await roomsRepository.getRooms();
      emit(RoomsLoaded(rooms));
    } catch (e) {
      emit(RoomsError(e as Exception));
    }
  }
}

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final List<Room> rooms;

  RoomsLoaded(this.rooms);
}

class RoomsError extends RoomsState {
  final Exception exception;
  RoomsError(this.exception);
}
