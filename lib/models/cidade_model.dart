import 'dart:convert';

class Cidademodel {
  int id;
  String nome;
  String municipio;
  int idUf;
  String uf;
  Cidademodel({
    this.id,
    this.nome,
    this.municipio,
    this.idUf,
    this.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'municipio': municipio,
      'idUf': idUf,
      'uf': uf,
    };
  }

  factory Cidademodel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cidademodel(
      id: map['id'],
      nome: map['nome'],
      municipio: map['municipio']['nome'],
      idUf: map['municipio']['microrregiao']['mesorregiao']['UF']['id'],
      uf: map['municipio']['microrregiao']['mesorregiao']['UF']['sigla'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidademodel.fromJson(String source) =>
      Cidademodel.fromMap(json.decode(source));
}
