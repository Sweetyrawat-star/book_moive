import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_text_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_text_event.dart';
part 'splash_text_state.dart';

class SplashTextBloc extends Bloc<SplashTextEvent, SplashTextState> {
  final String _fullText = "Explore Upcoming Movies today.";
  late Timer _timer;

  SplashTextBloc() : super(SplashTextInitial()) {
    on<StartTypingEvent>(_onStartTypingEvent);
  }

  void _onStartTypingEvent(StartTypingEvent event,
      Emitter<SplashTextState> emit) async {
    int currentIndex = 0;
    Completer<void> completer = Completer<void>();

    Timer timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (currentIndex <= _fullText.length) {
        emit(DisplayTextChanged(_fullText.substring(0, currentIndex)));
        currentIndex++;
      } else {
        timer.cancel();
        Timer(const Duration(milliseconds: 0), () {
          emit(DisplayTextChanged(''));
          completer.complete();
        });
      }
    });

    await completer.future;
  }
}
