import 'package:flutter/material.dart';
import 'package:octave/ViewModel/login_viewmodel.dart';
import 'package:octave/utils/custom_button_submit.dart';

import 'Refactor/logger.dart';
import 'dashboard.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var viewModel = LoginViewModel.login();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const Register())),
                  child: Container(
                      height: 200,
                      width: 225,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/Octavepng.png'))),
                      child: const SizedBox()),
                ),
                Logger(
                  formKey: formKey,
                  viewModel: viewModel,
                  onChanged: (LoginViewModel value) =>
                      setState(() => viewModel = value),
                ),
                CustomButtonSubmit(
                    name: 'Login',
                    onTap: () async {
                      var isValid = formKey.currentState!.validate();
                      var viewValid = await viewModel.isValid();

                      assert(isValid == viewValid, 'Both must be true');

                      if (!mounted) return;
                      if (viewValid && isValid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const Dashboard()));
                      }
                      setState(() {});
                    }),
                CustomButtonSubmit(
                    name: 'Register',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const Register())))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
