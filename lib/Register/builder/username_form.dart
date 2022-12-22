import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? currentValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;

  const UserForm(
      {Key? key,
      required this.onChanged,
      required this.validator,
      this.currentValue,
      this.nextFocusNode,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      focusNode: focusNode,
      initialValue: currentValue,
      onChanged: onChanged,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: 'Your name',
        labelText: 'Username',
        helperText: '',
      ),
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      validator: validator,
    );
  }
}
