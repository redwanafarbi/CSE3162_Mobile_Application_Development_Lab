import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String apiKey = '80ee07c8ff99d2758147aeaab95033ab'; // Replace with your OpenWeatherMap API key
  String city = 'Rajshahi';
  // Define variables to store weather data here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        //Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fnature%2Fcloud&psig=AOvVaw3qapLrMeMIktfIa2Fk3zNh&ust=1694510268268000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNCO_eicooEDFQAAAAAdAAAAABAJ', fit: BoxFit.cover,),
        Text('Weather App'),

      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                city = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter a city',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Future<void> fetchWeatherData() async {
                var url = Uri.https('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');
                var response = await http.get(url);

                if (response.statusCode == 200) {
                  // Parse and store current weather data from the response
                  final currentWeatherData = json.decode(response.body);
                  setState(() {
                    // Update current weather variables
                  });

                  // Make another API request for the 5-day forecast and update the forecast variables
                  // Use a similar approach as above

                } else {
                  throw Exception('Failed to load weather data');
                }
              }
            },
            child: Text('Get Weather'),
          ),
          // Display weather data here using ListView
        ],
      ),
    );
  }
}



