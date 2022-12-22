import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FormFieldValidator<String> validator;
  final String? currentValue;

  const PasswordForm(
      {Key? key,
      required this.onChanged,
      this.focusNode,
      this.nextFocusNode,
      required this.validator,
      this.currentValue})
      : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      obscureText: obscureText,
      onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      initialValue: widget.currentValue,
      decoration: InputDecoration(
          hintText: 'Input your password',
          labelText: 'Password',
          helperText: '',
          suffixIcon: IconButton(
            onPressed: () => setState(() => obscureText = !obscureText),
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          )),
    );
  }
}
