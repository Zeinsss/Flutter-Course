import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Device {
  EURO(0.95),
  RIELS(4020),
  DONG(25400);

  final double ratio;
  const Device(this.ratio);
}

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  Device device = Device.EURO;
  final dollarInput = TextEditingController();
  double dollar = 0.0;
  double convertedValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dollarInput.dispose();
    super.dispose();
  }

  void convert(double ratio) {
    setState(() {
      dollar = double.tryParse(dollarInput.text) ?? 0.0; 
      convertedValue = dollar * ratio;
    });
  }

  void showConversion() {
    convert(device.ratio);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10), 
          TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => showConversion(),
              controller: dollarInput,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
              
          const SizedBox(height: 30),
          SizedBox(
            width: 150,
            height: 50,
            child: DropdownButton(
              menuWidth: 150,
              items: Device.values
                  .map(
                    (e) =>
                        DropdownMenuItem<Device>(value: e, child: Text(e.name)),
                  )
                  .toList(),
              onChanged: (Device? newValue) {
                setState(() {
                  device = newValue!;
                });
              },
              value: device,
            ),
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(convertedValue.toString()))
        ],
      )),
    );
  }
}
