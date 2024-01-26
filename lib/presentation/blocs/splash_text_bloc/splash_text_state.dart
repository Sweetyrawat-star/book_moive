part of 'splash_text_bloc.dart';

@immutable
abstract class SplashTextState {}

class SplashTextInitial extends SplashTextState {}

class DisplayTextChanged extends SplashTextState {
  final String displayText;

  DisplayTextChanged(this.displayText);
}