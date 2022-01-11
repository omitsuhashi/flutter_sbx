import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sbx/apps/countdown_rp/provider.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: const [CounterWidget(), ButtonsWidget()],
      mainAxisAlignment: MainAxisAlignment.center,
    ));
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter =
        ref.watch(timerProvider.select((value) => value.displayTime));
    return Text(counter.toString());
  }
}

class ButtonsWidget extends ConsumerWidget {
  const ButtonsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = ref.watch(isActiveProvider.state);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isActive.state
            ? ButtonWidget(
                'pause',
                () {
                  ref.read(timerProvider.notifier).stop();
                },
                key: const Key('pause'),
              )
            : ButtonWidget(
                'start',
                () {
                  ref.read(timerProvider.notifier).start();
                },
                key: const Key('start'),
              ),
        ButtonWidget(
          'reset',
          ref.read(timerProvider.notifier).reset,
          key: const Key('reset'),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonWidget(this.text, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
