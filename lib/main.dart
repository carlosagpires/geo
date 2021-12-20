import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geo/build_compass.dart';
import 'package:geo/my_coordinates.dart';
import 'package:geo/velocity_accuracy.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GPS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GeoLocationExample(),
    );
  }
}

class GeoLocationExample extends StatefulWidget {
  const GeoLocationExample({Key? key}) : super(key: key);

  @override
  GeolocationExampleState createState() => GeolocationExampleState();
}

class GeolocationExampleState extends State {
  Position? _position;

  MyCoordinates myCoordinates = MyCoordinates(); //new
  String myLatitude = "...Lat...";
  String myLongitude = "...Long...";

  NewCompass myCompass = NewCompass();
  MyVelocityAndAccuracy myVelocityAndAccuracy = MyVelocityAndAccuracy();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 1)
        .listen((Position position) {
      setState(() {
        _position = position;

        myLatitude = myCoordinates.myLatitude(_position!);
        myLongitude = myCoordinates.myLongitude(_position!);

        myCompass.buildCompass();
      });
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter GPS'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 5.0),
                Icon(Icons.navigation, color: Colors.blue, size: 75.0)
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [myCompass.buildCompass()],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Text(myLatitude, textScaleFactor: 2.0),
                  Text(myLongitude, textScaleFactor: 2.0),
                ])
              ],
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 80.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.amber.shade500,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  children: [
                    myVelocityAndAccuracy.buildVelocity(_position),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 80.0,
                width: 150.0,
                decoration: BoxDecoration(
                    color: Colors.purple.shade800,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  children: [myVelocityAndAccuracy.buildAccuracy(_position)],
                ),
              ),
            ])
          ],
        ));
  }
}
