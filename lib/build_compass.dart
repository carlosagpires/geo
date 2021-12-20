import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class NewCompass {
  Widget buildCompass() {
    return StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('<Erro de leitura da posição>: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          double? direction = snapshot.data!.heading;

          // if direction is null, then device does not support this sensor
          // show error message
          if (direction == null) {
            return const Center(
              child: Text("O Dispositivo não tem sensores!"),
            );
          }

          return Transform.rotate(
            angle: (direction * (math.pi / 180) * -1),
            child: Image.asset(
              'assets/images/rosaventos.png',
              height: 280,
              width: 280,
              fit: BoxFit.fitWidth,
            ),
          );
        });
  }
}
