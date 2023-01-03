import 'package:flutter/material.dart';
import 'View/login.dart';

void main() => runApp(const Octave());

class Octave extends StatelessWidget {
  const Octave({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          labelStyle: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(48, 48),
                  bottomRight: Radius.elliptical(48, 48),
                  topRight: Radius.circular(12)),
              gapPadding: 12.0,
              borderSide: BorderSide(color: Colors.black, width: 1.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(48, 48),
                  bottomRight: Radius.elliptical(48, 48),
                  topRight: Radius.circular(12)),
              gapPadding: 12.0,
              borderSide: BorderSide(color: Colors.black, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          suffixIconColor: Colors.black,
        ),
      ),
      home: const Login(),
    );
  }
}
