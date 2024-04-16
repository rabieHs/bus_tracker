import 'package:bus_track/models/bus.dart';

class Helper {
  List<Bus> helperData = [
    Bus(
      busId: "ABC123",
      numberOfSeats: 50,
      availableSeats: 10,
      currentCity: "gabes",
      busRoute: [
        BusRoute(
            cityName: "gabes",
            arrivalTime: DateTime.parse("2024-04-11T08:00:00Z")), //0
        BusRoute(
            cityName: "sfax",
            arrivalTime: DateTime.parse("2024-04-11T10:00:00Z")), //1
        BusRoute(
            cityName: "tunis",
            arrivalTime: DateTime.parse("2024-04-11T12:00:00Z")), //2
      ],
    ),

    // destination ==> 0 < 2
    Bus(
      busId: "ABC456",
      numberOfSeats: 50,
      availableSeats: 10,
      currentCity: "tunis",
      busRoute: [
        BusRoute(
            cityName: "tunis",
            arrivalTime: DateTime.parse("2024-04-11T08:00:00Z")), //0
        BusRoute(
            cityName: "sfax",
            arrivalTime: DateTime.parse("2024-04-11T10:00:00Z")), //1
        BusRoute(
            cityName: "gabes",
            arrivalTime: DateTime.parse("2024-04-11T12:00:00Z")), //2
      ],
    ),

    //gabes 2 >0
    Bus(
      busId: "ZER125",
      numberOfSeats: 50,
      availableSeats: 10,
      currentCity: "tunis",
      busRoute: [
        BusRoute(
            cityName: "tunis",
            arrivalTime: DateTime.parse("2024-04-11T08:00:00Z")), //0
        BusRoute(
            cityName: "sidi bouzid",
            arrivalTime: DateTime.parse("2024-04-11T10:00:00Z")), //1
        BusRoute(
            cityName: "gafsa",
            arrivalTime: DateTime.parse("2024-04-11T12:00:00Z")), //2
      ],
    ),
  ];

  List<Bus> getBus(String currentCity, String destination) {
    print(currentCity);
    print(destination);
    return helperData.where((bus) {
      bool isRoute = bus.busRoute.any((route) => currentCity == route.cityName);
      if (!isRoute && bus.currentCity != currentCity) {
        return false;
      }

      int currentIndex =
          bus.busRoute.indexWhere((element) => currentCity == element.cityName);
      int destinationIndex =
          bus.busRoute.indexWhere((element) => destination == element.cityName);
      if (currentIndex == -1 || destinationIndex == -1) {
        return false;
      }
      if (destinationIndex > currentIndex) {
        return true;
      }

      return false;
    }).toList();
  }
}
