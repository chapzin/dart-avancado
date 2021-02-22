import 'package:dart_application_1/dao/cidade_dao.dart';
import 'package:dart_application_1/dao/conexao.dart';
import 'package:dart_application_1/dao/estado_dao.dart';
import 'package:dart_application_1/repository/cidade_repository.dart';
import 'package:dart_application_1/repository/estado_repository.dart';

void main(List<String> arguments) async {
  var estadoDao = EstadoDao();
  var estadoRepository = EstadoRepository();
  var cidadeDao = CidadeDao();
  var cidadeRepository = CidadeRepository();

  Future sleep() {
    return new Future.delayed(const Duration(seconds: 2), () => "2");
  }

  var conn = await getConnection();

  var res = await estadoRepository.getEstados();
  res.forEach((e) async {
    await estadoDao.AdicionarCidade(e, conn);
    await sleep();
    var cidades = await cidadeRepository.getCidades(e.id);
    cidades.forEach((c) async {
      await sleep();
      await cidadeDao.AdicionarCidade(c, conn);
    });
  });
}
