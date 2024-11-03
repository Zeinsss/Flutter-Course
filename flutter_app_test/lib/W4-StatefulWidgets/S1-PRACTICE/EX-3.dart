import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum IconPosition{Left(Alignment.centerLeft), Right(Alignment.centerRight);

  final Alignment position;
  const IconPosition(this.position);
}

// ignore: constant_identifier_names
enum ButtonType{ Primary(Color((0xFF0050FF))), Secondary(Color(0xFF00FF0F)), Disabled(Color.fromARGB(15, 54, 54, 54));
  final Color color;
  const ButtonType(this.color);
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.icon, required this.type, required this.pos});

  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition pos;

  Color get colorButton => type.color;
  Alignment get positionIcon => pos.position;
  IconData get iconButton => icon;

  void onPressed() {
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorButton,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: positionIcon,
                  widthFactor: 4,
                  child: Icon(iconButton), 
                ),
                Align(
                  alignment: positionIcon == Alignment.centerLeft ? Alignment.centerRight : Alignment.centerLeft,
                  widthFactor: 1.5,
                  child: Text(label, style: const TextStyle(fontSize: 20)),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text(
        'Custom buttons',
        selectionColor: Color(0xFF000000),
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.white,
    ),
    body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(label: "Submit", icon: Icons.check, type: ButtonType.Primary, pos: IconPosition.Left),
            CustomButton(label: "Time", icon: Icons.timer, type: ButtonType.Secondary, pos: IconPosition.Right),
            CustomButton(label: "Disabled", icon: Icons.disabled_by_default, type: ButtonType.Disabled, pos: IconPosition.Left),
          ],
        )),
  )));
}
