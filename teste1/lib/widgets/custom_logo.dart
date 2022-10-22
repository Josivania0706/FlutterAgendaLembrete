import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      width: 100,
      height: 100,
    );
  }
}
