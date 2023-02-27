import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorTextFormFields extends StatelessWidget {
  const RangeSelectorTextFormFields({
    Key? key, 
    required this.labelText, 
    required this.intValueSetter
    }) : super(key: key);

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

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    super.key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  });

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
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
              intValueSetter: minValueSetter,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormFields(
              labelText: 'Maximum',
              intValueSetter: maxValueSetter,
            )
          ],
        ),
      ),
    );
  }
}
