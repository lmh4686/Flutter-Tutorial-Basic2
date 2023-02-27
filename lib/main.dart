import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:flutter_foundations/range_selector-page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppWidget());
}

//Used for ref.watch() argument no need to be defined in main
final randomizerProvider = ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provide RandomizerChangeNotifier access to any child widgets.
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}
