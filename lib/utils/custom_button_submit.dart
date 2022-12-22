import 'package:flutter/material.dart';

class CustomButtonSubmit extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const CustomButtonSubmit({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.only(bottom: 18.0),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: const Color(0x5F97B0DF),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Center(
                child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ))));
  }
}
