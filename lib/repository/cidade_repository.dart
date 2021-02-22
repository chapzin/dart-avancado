import 'package:dart_application_1/models/cidade_model.dart';
import 'package:dio/dio.dart';

class CidadeRepository {
  Future<List<Cidademodel>> getCidades(int idUf) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idUf/distritos';
    var dio = Dio();
    var response = await dio.get(url);
    List<Cidademodel> cidades = [];

    if (response.statusCode == 200) {
      var respData = response.data;
      respData.forEach((cid) {
        var cidade = Cidademodel.fromMap(cid);
        cidades.add(cidade);
      });
    }
    return cidades;
  }
}
