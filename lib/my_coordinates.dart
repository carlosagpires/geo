import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong_to_osgrid/latlong_to_osgrid.dart';

class MyCoordinates {
  final LatLongConverter converter = LatLongConverter();

  var f = NumberFormat("###.000", "pt_PT");
  var fn = NumberFormat("##", "pt_PT");

  String myLatitude(Position myPosition) {
    List resultLat = [0, 0, 0];
    resultLat = converter.getDegreeFromDecimal(myPosition.latitude);
    String strLatitude = "";

    if (resultLat[0] >= 0) {
      strLatitude =
          "N ${resultLat[0]}º ${resultLat[1]}' ${f.format(resultLat[2])}''";
    } else if (resultLat[0] < 0) {
      strLatitude =
          "S ${resultLat[0].abs()}º ${resultLat[1]}' ${f.format(resultLat[2])}''";
    } else {
      strLatitude = "Ooops!!! Erro!";
    }
    return strLatitude;
  }

  String myLongitude(Position myPosition) {
    List resultLong = [0, 0, 0];
    resultLong = converter.getDegreeFromDecimal(myPosition.longitude);
    String strLongitude = "";

    if (resultLong[0] >= 0) {
      strLongitude =
          "E ${resultLong[0]}º ${resultLong[1]}' ${f.format(resultLong[2])}''";
    } else if (resultLong[0] < 0) {
      strLongitude =
          "W ${resultLong[0].abs()}º ${resultLong[1]}' ${f.format(resultLong[2])}''";
    } else {
      strLongitude = "Ooops!!! Erro!";
    }
    return strLongitude;
  }
}
