import 'package:teste1/models/lembretes.dart';
import 'package:teste1/models/usuario.dart';

class Database {
  static final Database _singleton = Database._internal();

  Database._internal();

  factory Database() {
    return _singleton;
  }

  List<Usuario> usuario = [
    Usuario(codigo: 1, nome: "josi", email: "j", senha: "1")
  ];

  List<Lembretes> lembretes = [
    Lembretes(codigo: 1, titulo: "Flutterama", descricao: "Aula toda semana"),
    Lembretes(codigo: 2, titulo: "FUP", descricao: "AULAS NAS SEGUNDAS"),
    Lembretes(codigo: 3, titulo: "PAA", descricao: "AULAS NAS QUINTAS"),
    Lembretes(codigo: 4, titulo: "MC", descricao: "AULAS NAS SEXTAS"),
  ];

  void addLembrete(Lembretes lembrete) {
    lembretes.add(lembrete);
  }

  void removeLembrete(int index) {
    lembretes.removeAt(index);
  }

  Usuario? login(String email, String senha) {
    for (int i = 0; i < 10; i++) {}

    for (var usuario in usuario) {
      if (usuario.email == email && usuario.senha == senha) {
        return usuario;
      }
    }
    return null;
  }

  Usuario? usuarioLogado;
}
