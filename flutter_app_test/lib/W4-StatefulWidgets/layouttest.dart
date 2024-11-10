import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        color: Colors.red,
        height: 100,
      ),
      Container(
        color: Colors.blue,
        width: 100,
        height: 200,
      ),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
              height: 100,
            ),
          ),
          Container(
            color: Colors.pink,
            width: 100,
            height: 100,
          ),
        ],
      ),
      Container(
        color: Colors.white,
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 100,
                  child: Container(
                    color: Colors.yellow,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 100,
                  child: Container(
                    color: Colors.yellow,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 100,
                  child: Container(
                    color: Colors.yellow,
                  ),
                )),
          ],
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.pink,
      ))
    ],
      )));
}
