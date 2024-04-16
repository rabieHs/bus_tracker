// ignore_for_file: public_member_api_docs, sort_constructors_first
class Bus {
  final String busId;
  final int numberOfSeats;
  final int availableSeats;
  String currentCity;
  final List<BusRoute> busRoute;

  Bus({
    required this.busId,
    required this.numberOfSeats,
    required this.availableSeats,
    required this.currentCity,
    required this.busRoute,
  });
}

class BusRoute {
  final String cityName;
  final DateTime arrivalTime;

  BusRoute({required this.cityName, required this.arrivalTime});
}
