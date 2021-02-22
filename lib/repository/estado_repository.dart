import 'package:dart_application_1/models/estado_model.dart';
import 'package:dio/dio.dart';

class EstadoRepository {
  Future<List<EstadoModel>> getEstados() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    var dio = Dio();
    var response = await dio.get(url);
    List<EstadoModel> estados = [];

    if (response.statusCode == 200) {
      var respData = response.data;
      respData.forEach((cid) {
        var estado = EstadoModel.fromMap(cid);
        estados.add(estado);
      });
    }
    return estados;
  }
}
