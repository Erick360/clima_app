import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget{
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState()=> _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>{

  void initState(){
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = new Location();
   await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async{

    http.Response response = await http.get(Uri.parse(''));
    if(response.statusCode == 200){
      String data = response.body;
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