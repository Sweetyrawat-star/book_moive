import 'package:flutter/material.dart';

class UpComingMoiveDetailsIndicator extends StatelessWidget {
  const UpComingMoiveDetailsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
