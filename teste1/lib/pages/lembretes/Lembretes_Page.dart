import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../db/database.dart';
import '../../models/lembretes.dart';
import '../../widgets/custom_edit.dart';

class LembretesPage extends StatefulWidget {
  const LembretesPage({super.key});

  @override
  State<LembretesPage> createState() => _LembretesPageState();
}

class _LembretesPageState extends State<LembretesPage> {
  final TextEditingController textTitulo = TextEditingController();
  final TextEditingController textDescricao = TextEditingController();

  void adicionar(String a, String b) {
    setState(
      () {
        Database().addLembrete(
          Lembretes(
              codigo: Database().lembretes.length + 1, descricao: a, titulo: b),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("adicionar")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              CustomEdit(
                controller: textTitulo,
                hintText: 'Informe o titulo',
                icon: Icons.title,
                validator: (value) {
                  if (value == null) {
                    return "Informe o titulo";
                  }
                  if (value.trim() == "") {
                    return "Informe o titulo";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomEdit(
                controller: textDescricao,
                hintText: 'Informe a descrição',
                icon: Icons.description,
                validator: (value) {
                  if (value == null) {
                    return "Informe a descrição";
                  }
                  if (value.trim() == "") {
                    return "Informe a descrição";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            adicionar(textDescricao.text.trim(), textTitulo.text.trim());
            Navigator.pop(context);
          },
          label: const Text("Salvar"),
          icon: const Icon(Icons.save)),
    );
  }
}
