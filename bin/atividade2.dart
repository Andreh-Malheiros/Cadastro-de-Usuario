import 'dart:io';
import 'dart:math';

Random random = Random();

void main() {
  Empresa empresa = Empresa();

  print("---------------");
  print("BEM VINDO AO NOSSO SISTEMA DE CADASTRO DE USUARIO");
  print("---------------");
  enter();

  var opcao = 0;

  do {
    print("Selecione uma opçao a seguir!");
    print("-----------------------------");
    print(
        " 1 - Adicionar \n 2 - Remover \n 3 - Aumentar Salario \n 4 - Exibir informaçoes \n 5 - Sair");
    print("");
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        print("Digite o nome do Funcionario");
        String? nome = stdin.readLineSync()!;
        print(" ");

        print("Digite o seu salario");
        double salario = double.parse(stdin.readLineSync()!);
        print(" ");

        print("Digite o seu cargo");
        String? cargo = stdin.readLineSync()!;
        print(" ");

        int id = random.nextInt(101);

        Funcionario fun = Funcionario(id, nome, cargo, salario);

        empresa.adicionarUsuario(fun);

        break;

      case 2:
        print("Qual é o ID do funcionaro que deseja remover?");
        int idProcurado = int.parse(stdin.readLineSync()!);
        empresa.removerUsuario(idProcurado);

        break;

      case 3:
        print("Qual é o ID do funcionaro que deseja atualizar o salario?");
        int idProcurado = int.parse(stdin.readLineSync()!);
        print("Qual é a porcentagem que deseja aumentar?");
        double percentual = double.parse(stdin.readLineSync()!);
        empresa.aumentarSalario(idProcurado, percentual);

        break;

      case 4:
        empresa.listarUsuarios();
        enter();
        break;

      case 5:
        print("Saindo do programa...");
        print("");
        break;

      default:
        print("Opçao invalida");
        print("");
        break;
    }
  } while (opcao != 5);
}

void enter() {
  stdin.readLineSync();
}

class Funcionario {
  final int id;
  final String nome;
  final String cargo;
  late double _salario;

  Funcionario(this.id, this.nome, this.cargo, this._salario);

  int getId() {
    return id;
  }

  void aumento(double percentual) {
    _salario += _salario * (percentual / 100);
  }
}

class Empresa {
  List<Funcionario> funcionarios = [];

  void adicionarUsuario(Funcionario funcionario) {
    funcionarios.add(funcionario);

    print("Usuario cadastrado com sucesso!");
  }

  void listarUsuarios() {
    if (funcionarios.isEmpty) {
      print("Nenhum usuario cadastrado!");
    } else {
      print("--- FUNCIONARIOS CADASTRADOS ---");
      for (var funcionario in funcionarios) {
        print(" ");
        print(
            "Nome: ${funcionario.nome} | Salario: ${funcionario._salario} | Cargo: ${funcionario.cargo} | ID: ${funcionario.id}");
        print(" ");
      }
    }
  }

  void removerUsuario(int idProcurado) {
    for (int i = 0; i < funcionarios.length; i++) {
      if (funcionarios[i].id == idProcurado) {
        funcionarios.removeAt(i);
        print("Funcionario removido com sucesso");
      }
    }
  }

  void aumentarSalario(int idProcurado, double percentual) {
    for (int i = 0; i < funcionarios.length; i++) {
      if (funcionarios[i].getId() == idProcurado) {
        funcionarios[i].aumento(percentual);
        print("Salario Atualizado com sucesso!");
      }
    }
  }
}
