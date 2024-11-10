import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.isFavorite,
  });

  final bool isFavorite;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  late bool currentFavorite;
  late Color iconColor;

  @override
  void initState() {
    super.initState();

    currentFavorite = widget.isFavorite;
    iconColor = currentFavorite ? Colors.red : Colors.grey;
  }

  void changeFavorite() {
    setState(() {
      if (!currentFavorite) {
        currentFavorite = true;
        iconColor = Colors.grey;
      }
      else {
        currentFavorite = false;
        iconColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: changeFavorite,
              icon: Icon(
                Icons.favorite,
                color: iconColor,
              ))
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            CustomCard(isFavorite: true,),
            CustomCard(isFavorite: false,),
            CustomCard(isFavorite: true)
          ],
        ),
      ),
    ));
