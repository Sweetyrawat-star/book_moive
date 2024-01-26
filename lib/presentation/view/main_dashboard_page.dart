
import 'package:book_moive/presentation/view/widgets/upComing_moives_screen.dart';
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
