import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class MyVelocityAndAccuracy {
  var fn = NumberFormat("##", "pt_PT");

  String myVelocity(Position? myPosition) {
    String myVelocity =
        ((myPosition != null) ? fn.format(myPosition.speed) : "...Vel...");

    return myVelocity;
  }

  String myAccuracy(Position? myPosition) {
    String myAccuracy =
        ((myPosition != null) ? fn.format(myPosition.accuracy) : "...Accu...");

    return myAccuracy;
  }

  Widget buildVelocity(Position? myPosition) {
    String myVelocity = MyVelocityAndAccuracy().myVelocity(myPosition);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "Velocidade",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text("$myVelocity m/s",
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 35.0,
                )),
          ],
        ),
      ],
    );
  }

  Widget buildAccuracy(Position? myPosition) {
    String myAccuracy = MyVelocityAndAccuracy().myAccuracy(myPosition);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "Precisão",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text("$myAccuracy m",
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 35.0,
                )),
          ],
        ),
      ],
    );
  }
}
