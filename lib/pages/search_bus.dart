import 'package:bus_track/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/bus.dart';

class SearchBusScreen extends StatefulWidget {
  const SearchBusScreen({super.key});

  @override
  State<SearchBusScreen> createState() => _SearchBusScreenState();
}

class _SearchBusScreenState extends State<SearchBusScreen> {
  List<Bus> availableBus = [];
  String currentCity = "";
  String destination = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 50, bottom: 20),
        child: Column(
          children: [
            Card(
              child: Container(
                width: 500,
                height: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                          hint: Text("select start city"),
                          items: const [
                            DropdownMenuItem(
                              child: Text("Tunis"),
                              value: "tunis",
                            ),
                            DropdownMenuItem(
                                child: Text("Gabes"), value: "gabes"),
                            DropdownMenuItem(
                                child: Text("Sfax"), value: "sfax"),
                            DropdownMenuItem(
                                child: Text("Mednine"), value: "mednine"),
                            DropdownMenuItem(
                                child: Text(
                                  "ataouine",
                                ),
                                value: "tataouine"),
                            DropdownMenuItem(
                                child: Text("Gafsa"), value: "gafsa"),
                          ],
                          onChanged: (value) {
                            setState(() {
                              currentCity = value!;
                            });
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      DropdownButtonFormField(
                          hint: Text("select destination city"),
                          items: const [
                            DropdownMenuItem(
                              child: Text("Tunis"),
                              value: "tunis",
                            ),
                            DropdownMenuItem(
                                child: Text("Gabes"), value: "gabes"),
                            DropdownMenuItem(
                                child: Text("Sfax"), value: "sfax"),
                            DropdownMenuItem(
                                child: Text("Mednine"), value: "mednine"),
                            DropdownMenuItem(
                                child: Text(
                                  "Tataouine",
                                ),
                                value: "tataouine"),
                            DropdownMenuItem(
                                child: Text("Gafsa"), value: "gafsa"),
                          ],
                          onChanged: (value) {
                            setState(() {
                              destination = value!;
                            });
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          setState(() {
                            availableBus =
                                Helper().getBus(currentCity, destination);
                          });
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Center(
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            availableBus.isEmpty
                ? Center(
                    child: Text("There is no Availables bus for now"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: availableBus.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.bus_alert),
                        title: Text(availableBus[index].busId),
                        subtitle: Text(availableBus[index].currentCity),
                        trailing:
                            Text(availableBus[index].availableSeats.toString()),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
