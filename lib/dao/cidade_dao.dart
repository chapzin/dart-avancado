import 'package:mysql1/mysql1.dart';
import 'package:dart_application_1/models/cidade_model.dart';

class CidadeDao {
  Future<void> AdicionarCidade(Cidademodel cidade, MySqlConnection conn) async {
    var result = await conn.query(
        'insert into cidade (id,nome,municipio,id_uf,uf) values(?,?,?,?,?)',
        [cidade.id, cidade.nome, cidade.municipio, cidade.idUf, cidade.uf]);
    print(result.insertId);
  }
}
