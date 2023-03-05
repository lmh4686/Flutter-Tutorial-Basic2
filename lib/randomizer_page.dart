import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      //'Consumer' and 'builder' trigger widget rebuild every time when the 'notifyListeners' in 'RandomizerChangeNotifier' gets called.
      body: Center(
        child: Text(
            randomizer.generatedNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 42),
          ),
        ),
      // .extended enable to configure the floatingActionButtonLocation
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          //use 'ref.read' to ensure that any changes made to the RandomizerChangeNotifier state are reflected
          ref.read(randomizerProvider.notifier).generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
