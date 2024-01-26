import 'package:flutter/material.dart';

import '../../../common/constant/appColorConstant.dart';

class UpComingMoiveScreenAppBar extends StatelessWidget {
  final String title;
  const UpComingMoiveScreenAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Handle back button action
          },
          icon: const Icon(Icons.arrow_back,size: 30,color: darkBlack,),
        ),
        const SizedBox(width: 50,),
         Text(
          title,
          style: const TextStyle(fontSize: 20,color: darkBlack,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
