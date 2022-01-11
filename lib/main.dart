import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sbx/apps/countdown/main.dart';
import 'package:flutter_sbx/apps/countdown_rp/main.dart';
import 'package:flutter_sbx/apps/pageview/home.dart';
import 'package:flutter_sbx/apps/provider/home.dart';

import 'apps/todo/main.dart';

void main() {
  return runApp(const ProviderScope(child: Apps()));
}

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Apps',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('samples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CountDownRPPage())),
                child: const Text('CountDown ver. river_pod')),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CountDownPage())),
                child: const Text('CountDown')),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TodoWidget())),
                child: const Text('Todo')),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProviderApp())),
                child: const Text('Provider')),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageViewApp())),
                child: const Text('PageView'))
          ],
        ),
      ),
    );
  }
}
