import 'package:booking/domain/models/api/booking_api_model.dart';

class Booking {
  int id;
  String hotelName;
  String hotelAddress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  Booking.fromApi(BookingApiModel bookingApiModel)
      : id = bookingApiModel.id,
        hotelName = bookingApiModel.hotel_name,
        hotelAddress = bookingApiModel.hotel_adress,
        horating = bookingApiModel.horating,
        ratingName = bookingApiModel.rating_name,
        departure = bookingApiModel.departure,
        arrivalCountry = bookingApiModel.arrival_country,
        tourDateStart = bookingApiModel.tour_date_start,
        tourDateStop = bookingApiModel.tour_date_stop,
        numberOfNights = bookingApiModel.number_of_nights,
        room = bookingApiModel.room,
        nutrition = bookingApiModel.nutrition,
        tourPrice = bookingApiModel.tour_price,
        fuelCharge = bookingApiModel.fuel_charge,
        serviceCharge = bookingApiModel.service_charge;
}
