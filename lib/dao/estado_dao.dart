import 'package:mysql1/mysql1.dart';
import 'package:dart_application_1/models/estado_model.dart';

class EstadoDao {
  Future<void> AdicionarCidade(EstadoModel estado, MySqlConnection conn) async {
    var result = await conn.query(
        'insert into estado (id,sigla,nome,regiao) values(?,?,?,?)',
        [estado.id, estado.sigla, estado.nome, estado.regiao]);
    print(result.insertId);
  }

  Future<List<EstadoModel>> ListarCidades(MySqlConnection conn) async {
    List<EstadoModel> estados = [];
    var results = await conn.query('select * from cidade');
    for (var row in results) {
      var estado =
          EstadoModel(id: row[0], sigla: row[1], nome: row[2], regiao: row[3]);
      estados.add(estado);
    }
    return estados;
  }
}
