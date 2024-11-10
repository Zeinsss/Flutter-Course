import 'package:flutter/material.dart';

void main() => runApp(const MyCustomApp());

class MyCustomApp extends StatelessWidget {
  const MyCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  final List<String> _imagePaths = [
    "assets/w4-s2/bird.jpg",
    "assets/w4-s2/bird2.jpg",
    "assets/w4-s2/insect.jpg",
    "assets/w4-s2/girl.jpg",
    "assets/w4-s2/man.jpg",
  ];

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    });
  }

  void _prevImage() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _imagePaths.length) % _imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: const Text('Image Viewer'),
        actions: <Widget>[
            IconButton(onPressed: _prevImage, icon: const Icon(Icons.navigate_before)),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: IconButton(onPressed: _nextImage, icon: const Icon(Icons.navigate_next)),
            ),
          ],
      ),
      body: Image.asset(_imagePaths[_currentIndex]),
    );
  }
}
