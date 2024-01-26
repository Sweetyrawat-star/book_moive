
import 'package:book_moive/presentation/view/widgets/weather_text_widget.dart';
import 'package:flutter/material.dart';
import '../../common/constant/appColorConstant.dart';




class MainDashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: UpComingMoive(),
      ),
    );
  }
}
