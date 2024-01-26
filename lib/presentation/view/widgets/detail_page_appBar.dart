import 'package:flutter/material.dart';

class UpComingMoiveScreenAppBar extends StatelessWidget {
  const UpComingMoiveScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Handle back button action
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const Spacer(),
        const Text(
          '°C ℉',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
