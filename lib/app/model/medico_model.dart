class Medico {
  final String nome;
  final String especialidade;
  final String crm;
  final String? email;
  final String? telefone;
  final String? endereco;

  Medico({
    required this.nome,
    required this.especialidade,
    required this.crm,
    this.email,
    this.telefone,
    this.endereco,
  });
}