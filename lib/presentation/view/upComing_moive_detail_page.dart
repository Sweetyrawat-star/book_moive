import 'package:book_moive/presentation/view/widgets/upComing_moive_body.dart';
import 'package:book_moive/presentation/view/widgets/upcoming_moive_appBar.dart';
import 'package:book_moive/presentation/view/widgets/upcoming_moive_image.dart';
import 'package:flutter/material.dart';

import '../../common/constant/appColorConstant.dart';

class UpComingMoiveScreen extends StatefulWidget {
  final int id;
  final String tile;
  const UpComingMoiveScreen({
    super.key,
    required this.id, required this.tile,
  });

  @override
  State<UpComingMoiveScreen> createState() => _UpComingMoiveScreenState();
}

class _UpComingMoiveScreenState extends State<UpComingMoiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                orangeColor,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
            child: ListView(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                UpComingMoiveScreenAppBar(title: widget.tile,),
                  const SizedBox(height: 20),
                  UpComingMoiveImages(
                    id: widget.id,
                  ),
                  const SizedBox(height: 40),
                  UpComingMoiveDetailPageBody(
                    tile: widget.tile,
                    id: widget.id,
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  SlidePageRoute({required this.builder})
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
