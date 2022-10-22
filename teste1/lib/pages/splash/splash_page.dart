import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste1/widgets/custom_logo.dart';

import '../../routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool textoAnimated = false;
  bool logoAnimated = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        setState(() {
          textoAnimated = true;
        });
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() {
              logoAnimated = true;
            });

            Future.delayed(
              const Duration(seconds: 2),
              () {
                Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 117, 173, 219),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: textoAnimated ? 250 : -500,
            left: 0,
            right: 0,
            child: Text(
              'Flutterama: Descomplicando a programação em Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: 0,
            right: 0,
            top: logoAnimated ? 200 : -500,
            child: const CustomLogo(),
          )
        ],
      ),
    );
  }
}
