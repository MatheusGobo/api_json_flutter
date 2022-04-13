import 'package:aula_02_api_json/constantes.dart';
import 'package:aula_02_api_json/infra/infra.dart';
import 'package:aula_02_api_json/models/models.dart';

class TimeRemote {
  final _link = '${linkApiEsportes}Times/GetTime';
  final _clienteHttp = ClienteHTTP();


  Future<List<Time>> get() async {
    final lista = await _clienteHttp.getJson(_link);
    return lista.map((e) => Time.fromMap(e)).toList();
  }
}