import 'package:flutter/material.dart';

class DevicePage extends StatelessWidget {
  final String roomName;
  const DevicePage({super.key, required this.roomName});

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية لأجهزة داخل الغرفة المحددة
    final Map<String, List<String>> fakeDevices = {
      'Living Room': ['Light', 'AC'],
      'Bedroom': ['Fan', 'Lamp'],
      'Kitchen': ['Oven', 'Fridge'],
      'Office': ['Printer', 'PC'],
    };

    final devices = fakeDevices[roomName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('$roomName Devices')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: devices.isEmpty
            ? const Center(child: Text('No devices found'))
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  devices[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
