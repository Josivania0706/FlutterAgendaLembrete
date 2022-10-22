import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste1/db/database.dart';
import 'package:teste1/models/usuario.dart';
import 'package:teste1/widgets/custom_button.dart';
import 'package:teste1/widgets/custom_edit.dart';
import 'package:teste1/widgets/custom_logo.dart';

import '../../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textUsuario = TextEditingController();
  final TextEditingController textSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonClick = false;

  void _login() {
    if (buttonClick) {
      return;
    }
    setState(
      () {
        buttonClick = true;
      },
    );

    //gambiarra
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //login
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Buscando usuário..."),
            ),
          );
          Usuario? usuario =
              Database().login(textUsuario.text.trim(), textSenha.text.trim());
          if (usuario == null) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Usuario não encontrado"),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            Database().usuarioLogado = usuario;
            Navigator.of(context).pushReplacementNamed(Routes.HOME);
          }
        }
        setState(
          () {
            buttonClick = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const CustomLogo(),
              const SizedBox(
                height: 25,
              ),
              CustomEdit(
                controller: textUsuario,
                hintText: 'Informe o email',
                icon: Icons.person,
                validator: (value) {
                  if (value == null) {
                    return "Informe o email";
                  }
                  if (value.trim() == "") {
                    return "Informe o email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomEdit(
                controller: textSenha,
                hintText: 'Informe a senha',
                icon: Icons.password,
                validator: (value) {
                  if (value == null) {
                    return "Informe a senha";
                  }
                  if (value.trim() == "") {
                    return "Informe a senha";
                  }
                  return null;
                },
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                caption: 'Entrar',
                onTap: _login,
                loading: buttonClick,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
