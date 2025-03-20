import 'package:vollmed/app/model/endereco_model.dart';

class Medico {
  final int id;
  final String nome;
  final String especialidade;
  final String crm;
  final String? email;
  final Endereco endereco;

  Medico({
    required this.id,
    required this.nome,
    required this.especialidade,
    required this.crm,
    this.email,
    required this.endereco,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
        id: json['id'],
        nome: json['nome'],
        especialidade: json['especialidade'],
        crm: json['crm'],
        email: json['email'],
        endereco: Endereco.fromJson(json['endereco']));
  }
}
