import 'package:aula_02_api_json/constantes.dart';
import 'package:aula_02_api_json/extensions/extensions.dart';

class Time {
  int codigo;
  String nome;
  String bandeira;

  Time({required this.codigo, required this.nome, required this.bandeira});

  factory Time.fromMap(Map<String, dynamic> mapa) {
    return Time(
      codigo: mapa['Tim_Codigo'].toString().toInt(),
        nome: mapa['Tim_Nome'] ?? '',
        bandeira: (mapa['Tim_Bandeira'] ?? '').toString().replaceAll('~/', linkApi)
    );
  }
}