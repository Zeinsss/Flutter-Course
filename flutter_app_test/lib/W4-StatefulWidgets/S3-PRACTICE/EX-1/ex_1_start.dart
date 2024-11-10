import 'package:flutter/material.dart';

enum Status {
  selected("Selected", Color(0xFF2196f3), Colors.white),
  unselected("Not Selected", Color(0xFFe4f2fd), Colors.black);

  final String text;
  final Color btnColor;
  final Color txtColor;
  const Status(this.text, this.btnColor, this.txtColor);
}

class CustomizedElevatedButton extends StatefulWidget {
  const CustomizedElevatedButton({super.key, required this.inputStatus});

  final Status inputStatus;

  @override
  State<CustomizedElevatedButton> createState() =>
      _CustomizedElevatedButtonState();
}

class _CustomizedElevatedButtonState extends State<CustomizedElevatedButton> {
  late Status currentStatus;

  @override
  void initState() {
    super.initState();

    currentStatus = widget.inputStatus;
  }

  String get btnText => currentStatus.text;
  Color get btnColor => currentStatus.btnColor;
  Color get txtColor => currentStatus.txtColor;

  void changeStatus() {
    setState(() {
      switch (currentStatus) {
        case Status.unselected:
          currentStatus = Status.selected;
          break;
        case Status.selected:
          currentStatus = Status.unselected;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(btnColor)),
          onPressed: changeStatus,
          child: Center(
            child: Text(btnText, style: TextStyle(color: txtColor)),
          )),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomizedElevatedButton(inputStatus: Status.selected),
            CustomizedElevatedButton(inputStatus: Status.unselected),
            CustomizedElevatedButton(inputStatus: Status.selected),
            CustomizedElevatedButton(inputStatus: Status.unselected),
          ],
        )),
      ),
    ));
