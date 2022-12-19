import 'dart:convert';

class Endereco {
  String cep;
  String logradouro;
  String? complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String? gia;
  String ddd;
  String siafi;
  Endereco({
    required this.cep,
    required this.logradouro,
    this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    this.gia,
    required this.ddd,
    required this.siafi,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ibge: map['ibge'] ?? '',
      gia: map['gia'] ?? '',
      ddd: map['ddd'] ?? '',
      siafi: map['siafi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));
}
