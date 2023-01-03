import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octave/View/Refactor/signup.dart';
import 'package:octave/ViewModel/signup_model.dart';

import '../utils/custom_button_submit.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  var viewModel = SignUpViewModel.newUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomRight,
        colors: <Color>[
          Color(0xff1f005c),
          Color(0xff5b0060),
          Color(0xff870160),
          Color(0xffac255e),
          Color(0xffca485c),
          Color(0xffe16b5c),
          Color(0xfff39060),
          Color(0xffffb56b),
        ],
        end: Alignment.topLeft,
      )),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(15),
                  height: 200,
                  width: 225,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/Octavepng.png'))),
                  child: const SizedBox()),
              SignUpForm(
                  formKey: formKey,
                  onChanged: (value) => setState(() => viewModel = value),
                  viewModel: viewModel),
              CustomButtonSubmit(
                  name: 'Register',
                  onTap: () {
                    var isValid = formKey.currentState!.validate();
                    assert(isValid == viewModel.isValid(),
                        'The view model and form must agree wether the form is valid');
                    if (kDebugMode) {
                      print("SingUp valid : $isValid\n$viewModel");
                    }

                    viewModel.createUser(
                        viewModel.username!, viewModel.password!);
                  }),
              CustomButtonSubmit(
                  name: 'Back', onTap: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    ));
  }
}
