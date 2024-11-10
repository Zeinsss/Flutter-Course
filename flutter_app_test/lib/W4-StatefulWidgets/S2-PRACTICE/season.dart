import 'package:flutter/material.dart';

enum Season {
  Spring("assets/season/spring.png"),
  Summer("assets/season/summer.png"),
  Autumn("assets/season/autumn.png"),
  Winter("assets/season/winter.png");

  final String url;
  const Season(this.url);
}

enum Country { Cambodia, French, USA }

class SeasonCard extends StatefulWidget {
  const SeasonCard({super.key, required this.country});

  final Country country;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  Season season = Season.Spring;

  void initState() {
    super.initState();
  }

  String get seasonImage => season.url;

  void changeSeason() {
    setState(() {
      switch (season) {
        case Season.Spring:
          season = Season.Summer;
          break;
        case Season.Summer:
          season = Season.Autumn;
          break;
        case Season.Autumn:
          season = Season.Winter;
          break;
        case Season.Winter:
          season = Season.Spring;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: changeSeason,
              child: Image.asset(seasonImage, width: 100, height: 200), 
            ),
            Text(widget.country.name),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: Container(
            width: 400,
            height: 600,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Center(
              child: Column(
                children: [
                  const Center(
                    child: Text('Seasons'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: const Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeasonCard(country: Country.Cambodia),
                      SeasonCard(country: Country.French),
                    ],
                  )
                  )
                ],
              ),
            ))),
  ));
}
