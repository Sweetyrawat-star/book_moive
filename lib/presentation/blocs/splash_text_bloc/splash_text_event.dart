part of 'splash_text_bloc.dart';

@immutable
abstract class SplashTextEvent {}
class StartTypingEvent extends SplashTextEvent {}

class TextChangedEvent extends SplashTextEvent {
  final String displayText;

  TextChangedEvent(this.displayText);
}