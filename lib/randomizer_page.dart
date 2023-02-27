import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      //'Consumer' and 'builder' trigger widget rebuild every time when the 'notifyListeners' in 'RandomizerChangeNotifier' gets called.
      body: Center(child: Consumer<RandomizerChangeNotifier>(
        builder: (context, notifier, child) {
          return Text(
            //Provider
            notifier.generatedNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 42),
          );
        },
      )),
      // .extended enable to configure the floatingActionButtonLocation
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          //Provider
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
