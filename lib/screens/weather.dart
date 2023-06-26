import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final dio = Dio();
  int temp = 0;
  double latitude = 0;
  double longitude = 0;
  String placeName = 'null';
  String weatherDesc = 'null';
  List<dynamic> dates = ['', '', '', '', ''];

  final String apikey = '91f2295c14a74c72dfeaa65d5ec185e1';

  Future<void> getWeather() async {
    Response response = await dio.get(
        'https://argo-backend.onrender.com/api/v1/weather/data',data: {
    "latitude":latitude,
    "longitude": longitude
});
    print(response.data['data']['main']['temp']);
    setState(() {
      temp = response.data['data']['main']['temp'].round() - 273;
      weatherDesc = response.data['data']['weather'][0]['main'];
    });
  }

  Future<void> getCurrentLocationData() async {
    bool isLocationServiceEnabled;
    LocationPermission permission;
    Position currentPosition;

    // Check if location services are enabled on the device
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    // Get the current position
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
    });

    // Reverse geocoding to get the place name
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks.last;
      setState(() {
        placeName = placemark.name ?? '';
      });

      print('Place Name: $placeName');
      print('Latitude: $latitude');
      print('Longitude: $longitude');
    } else {
      print('No placemarks found for the current coordinates');
    }
    getWeather();
  }

  void getNextFiveDates() {
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 5; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i + 1));
      String formattedDate = DateFormat('dd/MM').format(nextDate);
      dates[i] = formattedDate;
    }
  }

  @override
  void initState() {
    super.initState();
    getNextFiveDates();
    getWeather();
    getCurrentLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0CC0E7),
        centerTitle: true,
        title: const Text(
          'Weather',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/cloudy 3.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFFFFFF), Color(0xff1790AA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
        // Set the background color to light blue
        child: Stack(
          children: [
            Container(),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Icon(Icons.location_on, size: 30),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: Text(
                          placeName,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          temp.toString(),
                          style: const TextStyle(fontSize: 95),
                        ),
                        Image.asset(
                          'assets/images/°c.png',
                          width: 90,
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    weatherDesc,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${dates[0]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'TMR',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp + 1}C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${dates[1]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'DAT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp - 1}C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${dates[2]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '3DFN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp}C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${dates[3]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '4DFN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp - 1}C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${dates[4]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '5DFN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp + 3}C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
