import 'package:flutter/material.dart';



class HorizontalListScreen extends StatelessWidget {
  final List<String> timeList = [
    '12:00 PM',
    '03:00 PM',
    '06:00 PM',
    '09:00 PM',
    '12:00 AM',
  ];

  final List<int> temperatureList = [21, 24, 22, 20, 18]; // Temperature in Celsius

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: timeList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    timeList[index],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${temperatureList[index]}°C',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}
