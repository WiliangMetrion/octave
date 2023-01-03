import 'package:flutter/material.dart';
import 'package:octave/View/Form/password_form.dart';
import '../../ViewModel/signup_model.dart';
import '../Form/username_form.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<SignUpViewModel> onChanged;
  final SignUpViewModel viewModel;

  const SignUpForm(
      {Key? key,
      required this.formKey,
      required this.onChanged,
      required this.viewModel})
      : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            children: [
              UserForm(
                currentValue: widget.viewModel.username,
                onChanged: (s) =>
                    widget.onChanged(widget.viewModel.copyWith(username: s)),
                validator: widget.viewModel.userValidator,
                focusNode: usernameFocus,
                nextFocusNode: passwordFocus,
              ),
              PasswordForm(
                onChanged: (s) =>
                    widget.onChanged(widget.viewModel.copyWith(password: s)),
                validator: widget.viewModel.passwordValidator,
                currentValue: widget.viewModel.password,
                focusNode: passwordFocus,
              ),
            ],
          ),
        ));
  }
}
