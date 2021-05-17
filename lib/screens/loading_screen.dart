import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    String lat = location.latitude.toStringAsFixed(4);
    String lon = location.longitude.toStringAsFixed(4);
    print(lat);
    print(lon);
  }

  void getData() async {
    http.Response response = await http.get(Uri(
        scheme: 'https',
        host: 'samples.openweathermap.org',
        path: 'data/2.5/weather',
        query: 'lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02'));
    print(response.body);
  }
  // 'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02'

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
