import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sbx/apps/countdown/view.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountDownState();
}

class _CountDownState extends State<CountDownPage> {
  static const maxSeconds = 20;

  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => seconds = maxSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [buildTimer(), const SizedBox(height: 80), buildButtons()],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      appBar: AppBar(title: const Text('CountDown')),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;

    return isRunning || !isCompleted
        ? Row(
            children: [
              ButtonWidget(
                isRunning ? 'Pause' : 'Resume',
                isRunning ? stopTimer : startTimer,
                color: Colors.white,
                backgroundColor: Colors.red,
              ),
              const SizedBox(width: 12),
              ButtonWidget('Cancel', resetTimer)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        : ButtonWidget(
            'Start',
            startTimer,
            color: Colors.white,
            backgroundColor: Colors.blue,
          );
  }

  Widget buildTimer() => SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: seconds / maxSeconds,
            strokeWidth: 12,
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
          ),
          Center(child: buildTime())
        ],
      ));

  Widget buildTime() => Text(
        '$seconds',
        style: const TextStyle(
            color: Colors.black, fontSize: 80, fontWeight: FontWeight.bold),
      );
}
