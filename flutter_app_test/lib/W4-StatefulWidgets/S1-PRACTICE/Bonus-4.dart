// ignore: file_names
import 'package:flutter/material.dart';
// ignore: constant_identifier_names
enum Day{Monday('Mon'), Tuesday('Tue'), Wednesday('Wed'), Thursday('Thu'), Friday('Fri'), Saturday('Sat'), Sunday('Sun');
  final String name;
  const Day(this.name);
}

// ignore: constant_identifier_names
enum WeatherCondition{Sunny('assets/weather/sunny.png'), Cloudy('assets/weather/cloudy.png'), Rainy('assets/weather/rainy.png'), Snowy('assets/weather/snowy.png'), Stormy('assets/weather/stormy.png');

  final String weatherImage;
  const WeatherCondition(this.weatherImage);
}

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard({super.key, required this.minTemp, required this.maxTemp, required this.condition, required this.day});

  final int minTemp;
  final int maxTemp;
  final WeatherCondition condition;
  final Day day;

  String get weatherImage => condition.weatherImage;
  String get dayName => day.name;
  String get minTempValue => minTemp.toString();
  String get maxTempValue => maxTemp.toString();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color(0xFFf6f6f8),
          Color(0xFF219de1)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(weatherImage, width: 40, height: 40,),
              Text(dayName)
            ],
          ),
          const Spacer(flex: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$minTempValue°", style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.grey[300]),),
              Text("Min", style: TextStyle(fontSize: 15, decoration: TextDecoration.none, color: Colors.grey[300]),)
            ],
          ),
          const Spacer(flex: 1),
          Column(
            children: [
              Text("$maxTempValue°", style: const TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
              const Text("Max", style: TextStyle(fontSize: 15, decoration: TextDecoration.none, color: Colors.white),)
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color(0xFFf6f6f8),
      appBar: AppBar(
        title: const Text(
          'Weather Forecast App',
          style: TextStyle(fontSize: 15, decoration: TextDecoration.none),
        )
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: const Column(
          children: [
            WeatherForecastCard(minTemp: 17, maxTemp: 25, condition: WeatherCondition.Sunny, day: Day.Monday),
            WeatherForecastCard(minTemp: 15, maxTemp: 23, condition: WeatherCondition.Cloudy, day: Day.Tuesday),
            WeatherForecastCard(minTemp: 14, maxTemp: 22, condition: WeatherCondition.Rainy, day: Day.Wednesday),
            WeatherForecastCard(minTemp: 13, maxTemp: 21, condition: WeatherCondition.Snowy, day: Day.Thursday),
            WeatherForecastCard(minTemp: 12, maxTemp: 20, condition: WeatherCondition.Stormy, day: Day.Friday),
            WeatherForecastCard(minTemp: 11, maxTemp: 19, condition: WeatherCondition.Sunny, day: Day.Saturday),
            WeatherForecastCard(minTemp: 10, maxTemp: 18, condition: WeatherCondition.Cloudy, day: Day.Sunday),
          ],
        )
      )
    )
  ));
}