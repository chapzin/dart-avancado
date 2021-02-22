import 'dart:convert';

class EstadoModel {
  int id;
  String sigla;
  String nome;
  String regiao;
  EstadoModel({
    this.id,
    this.sigla,
    this.nome,
    this.regiao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
      'regiao': regiao,
    };
  }

  factory EstadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
      regiao: map['regiao']['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EstadoModel.fromJson(String source) =>
      EstadoModel.fromMap(json.decode(source));
}
