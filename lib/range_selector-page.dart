import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//HookWidget from flutter_hooks library
class RangeSelectorPage extends HookWidget {
  //unique widget identifier
  //enable formKey.currentState access out of the Form widget.
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    //No need to call setState method to rebuild
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          //trigger validator.
          if (formKey.currentState?.validate() == true) {
            //trigger onSaved.
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => RandomizerPage(
                    min: min.value,
                    max: max.value,
                  )),
            ));
          }
        },
      ),
    );
  }
}
