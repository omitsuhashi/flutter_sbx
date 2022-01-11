import 'package:flutter/material.dart';
import 'package:flutter_sbx/apps/countdown_rp/view.dart';

class CountDownRPPage extends StatelessWidget {
  const CountDownRPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [TimerWidget()],
        ),
      ),
      appBar: AppBar(
        title: const Text('CountDown ver. river_pod'),
      ),
    );
  }
}
