import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather_model.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  /*
  void getData() async {
    final String apiKey = '';
    final double latitude = 33.44;
    final double longitude = -94.04;
    final String url = 'https://api.openweathermap.org/data/3.0/onecall' '?lat=$latitude&lon=$longitude&exclude=hourly,daily&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print('Data retrieved successfully: $data');
    } else if (response.statusCode == 401) {
      print('Unauthorized request. Please check your API key.');
    }
    else {
      print('Error: ${response.statusCode}.');
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      /*
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              getLocation();
            },
            child: const Text('Get Location'),
        ),

      ),

       */
    );
  }
}
