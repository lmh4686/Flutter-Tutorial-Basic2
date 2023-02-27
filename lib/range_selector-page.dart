import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  //unique widget identifier
  //enable formKey.currentState access out of the Form widget.
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          //trigger validator.
          if (formKey.currentState?.validate() == true) {
            //trigger onSaved.
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => RandomizerPage(),
              )
            );
          }
        },
      ),
    );
  }
}
