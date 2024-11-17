import 'package:flutter/material.dart';
import 'package:flutter_app_test/W5-Layout, Input, List/EXERCISE-3/screen/temperature.dart';
import 'package:flutter_app_test/W5-Layout, Input, List/EXERCISE-3/screen/welcome.dart';



class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key, required this.screenState});

  final bool screenState;

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  
  late bool currentScreenState;

  @override
  void initState() {
    
    super.initState();
    currentScreenState = widget.screenState;
  }

  void setScreen(bool state) {
    setState(() {
      currentScreenState = state; 
    });
  }

  changeScreen() {
    if (currentScreenState) {
      setScreen(false);
    }
    else {
      setScreen(true);
    }
  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreenState ? Welcome(onButtonPressed: changeScreen) : const Temperature(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp(screenState: false,));
}
