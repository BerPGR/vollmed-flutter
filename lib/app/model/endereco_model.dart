class Endereco {
  final String logradouro;
  final String bairro;
  final String cep;
  final String numero;
  final String complemento;
  final String cidade;
  final String uf;

  const Endereco(
      {required this.logradouro,
      required this.bairro,
      required this.cep,
      required this.numero,
      required this.complemento,
      required this.cidade,
      required this.uf});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
        logradouro: json["logradouro"],
        bairro: json["bairro"],
        cep: json["cep"],
        numero: json["numero"],
        complemento: json["complemento"],
        cidade: json["cidade"],
        uf: json["uf"]);
  }
}
