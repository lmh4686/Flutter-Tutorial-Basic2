import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorTextFormFields extends StatelessWidget {
  const RangeSelectorTextFormFields({Key? key, required this.labelText, required this.intValueSetter}) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      //int.tryParse(value) returns int if the given string is convertible else return null
      //By default, validator has a argument which automatically get assigned the current state which is typed in the text box.
      //This is independent from the state _min and _max.
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      //int.parse('') returns 0
      //Same as validator argument
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      //unique widget identifier
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormFields(
              labelText: 'Minimum',
              //read current state of randomizerProvider using 'ref.read'
              intValueSetter: (value) => ref.read(randomizerProvider).min = value,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormFields(
              labelText: 'Maximum',
              //read current state of randomizerProvider using 'ref.read'
              intValueSetter: (value) => ref.read(randomizerProvider).max = value,
            )
          ],
        ),
      ),
    );
  }
}
