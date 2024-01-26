import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constant/appColorConstant.dart';
import '../../blocs/splash_text_bloc/splash_text_bloc.dart';
import '../city_weather_screen.dart';



class UpComingMoive extends StatefulWidget {
  @override
  State<UpComingMoive> createState() => _UpComingMoiveState();
}

class _UpComingMoiveState extends State<UpComingMoive> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashTextBloc()..add(StartTypingEvent()),
      child: BlocBuilder<SplashTextBloc, SplashTextState>(
        builder: (context, state) {
          String _displayText = '';
          double _initialFontSize = 24.0;
          double _finalFontSize = 46.0;
          double _topPosition = 42.0;
          double _leftPosition = 16.0;

          if (state is DisplayTextChanged) {
            _displayText = state.displayText;
          }

          return Stack(
            children: [
              AnimatedOpacity(
                opacity: _displayText.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: _leftPosition, top: _topPosition),
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: _displayText.isNotEmpty ? _finalFontSize : _initialFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      _displayText,
                      style: const TextStyle(color: greyDarkColor),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: AnimatedOpacity(
                  opacity: _displayText.isEmpty ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: _leftPosition, top: _topPosition, right: 16),
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontSize: _displayText.isEmpty ? _finalFontSize : _initialFontSize,
                        color: splashTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children:  [
                          Text(
                            'explore movies'.toUpperCase(),
                            style: const TextStyle(
                              color: darkBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: greyColor),
                          const SizedBox(height: 20),
                          const AnimatedScrollableList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
