import 'package:flutter/material.dart';
import 'package:teste1/pages/home/home_page.dart';
import 'package:teste1/pages/lembretes/Lembretes_Page.dart';
import 'package:teste1/pages/login/login_page.dart';
import 'package:teste1/pages/splash/splash_page.dart';
import 'package:teste1/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lembrete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: const SplashPage(),
      routes: {
        Routes.INITIAL: (context) => const SplashPage(),
        Routes.LOGIN: (context) => const LoginPage(),
        Routes.HOME: (context) => const HomePage(),
        Routes.LEMBRETES: (context) => const LembretesPage(),
      },
      initialRoute: Routes.INITIAL,
    );
  }
}
