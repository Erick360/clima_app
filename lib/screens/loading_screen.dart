import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget{
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState()=> _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>{

  @override
  void initState(){
    super.initState();
    getLocation();
    getData();
  }


  void getLocation() async {
    Location location = Location();
   await location.getCurrentLocation();
    //print(location.longitude);
    //print(location.latitude);
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

  void getData() async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={apiKey}'));
    if(response.statusCode == 200){
      String data = response.body;

      var decodedData = jsonDecode(data);

      String cityName =  decodedData['name'];
      print(cityName);
      int condition = decodedData['weather'][0]['id'];
      print(condition);
      double temp = decodedData['main']['temp'];
      print(temp);
    }else{
      print(response.statusCode);
    }
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(

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