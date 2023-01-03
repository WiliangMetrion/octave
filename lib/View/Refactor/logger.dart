import 'package:flutter/material.dart';
import 'package:octave/ViewModel/login_viewmodel.dart';
import 'package:octave/View/Form/password_form.dart';
import '../Form/username_form.dart';

class Logger extends StatefulWidget {
  final LoginViewModel viewModel;
  final ValueChanged<LoginViewModel> onChanged;
  final GlobalKey<FormState> formKey;

  const Logger(
      {Key? key,
      required this.viewModel,
      required this.onChanged,
      required this.formKey})
      : super(key: key);

  @override
  State<Logger> createState() => _LoggerState();
}

class _LoggerState extends State<Logger> {
  final usernameNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  void dispose() {
    usernameNode.dispose();
    passwordNode.dispose();
    super.dispose();
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
                focusNode: usernameNode,
                nextFocusNode: passwordNode,
                validator: widget.viewModel.userValidator,
                onChanged: (s) =>
                    widget.onChanged(widget.viewModel.copyWith(username: s)),
              ),
              PasswordForm(
                  currentValue: widget.viewModel.password,
                  focusNode: passwordNode,
                  onChanged: (String value) => widget
                      .onChanged(widget.viewModel.copyWith(password: value)),
                  validator: widget.viewModel.passwordValidator),
            ],
          ),
        ));
  }
}
