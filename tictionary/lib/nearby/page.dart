import 'dart:async';

import 'package:flutter/material.dart';
import 'amadeus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

String lat = "", long = "";
Future<Map> getData() async {
  await dotenv.load();
  Amadeus amadeus = Amadeus();
  LocationPermission permission = await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position? position) {});
  lat = "41.39165";
  long = "2.164772";
  data = await Amadeus().getHotelOffers(
          "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=$lat&longitude=$long&radius=10>");
  return data;
  // print(data);
}

class NearByApp extends StatelessWidget {
  const NearByApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tictionary',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: NearByPage(title: 'Points of Interest'));
  }
}

// void printData() {
//   if (data['name'] == Null) {
//     Text('No places!');
//   } else {
//     Text(data['name']);
//   }
//   ;
// }
Map data = {};

class NearByPage extends StatefulWidget {
  @override
  const NearByPage({super.key, required this.title});
  final String title;

  @override
  State<NearByPage> createState() => _NearByPageState();
}

class _NearByPageState extends State<NearByPage> {
  @override
  Widget build(BuildContext context) {
    final String lat = "41.39165";
    final String long = "2.164772";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_tictionary.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Points of Interest'))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Center(
            child: Row(
              children: [
                Image.asset(
                  'assets/map_icon.jpeg',
                  height: 32,
                ),
                Text(
                  "Latitute: $lat, Longitude: $long",
                  style: TextStyle(fontSize: 16),
                  // textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          // SizedBox(
          //   height: 50,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Color.fromARGB(255, 8, 143, 118),
          //       shape: RoundedRectangleBorder(
          //         //to set border radius to button
          //         borderRadius: BorderRadius.circular(32),
          //       ),
          //       textStyle: const TextStyle(color: Colors.white),
          //     ),
          //     onPressed: printData,
          //     child: const Center(
          //       child: Text(
          //         "Show nearby places",
          //         style: TextStyle(
          //             fontFamily: 'nunito', fontSize: 20, color: Colors.white),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),

          // ),

          FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                print("Hello");
                print(snapshot);
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // String nm = snapshot.data![0]['name'];
                // print(nm);
                return SizedBox(
                    height: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 40,
                              width: 40,
                              child: Text(
                                snapshot.data!['data'][index]['name'],
                              ));
                        }));
                // return Text("h");
              }),
        ],
      ),
    );
  }
}
