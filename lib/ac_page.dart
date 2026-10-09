import 'package:flutter/material.dart';

class ACPage extends StatelessWidget {
  const ACPage({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية لأجهزة التكييف
    final List<String> acDevices = [
      'Living Room AC',
      'Bedroom AC',
      'Office AC',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('AC Devices')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: acDevices.length,
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
                  acDevices[index],
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
