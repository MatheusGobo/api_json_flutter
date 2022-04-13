import 'package:flutter/material.dart';

import 'package:aula_02_api_json/models/models.dart';
import 'package:aula_02_api_json/ui/components/components.dart';
import 'package:aula_02_api_json/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class ListaTime extends StatelessWidget {
  final List<Time> lista;

  const ListaTime({required this.lista, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _abrirItem(context, lista[index]);
          },
          child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Imagem(linkImage: lista[index].bandeira, height: 60, width: 60, boxfit: BoxFit.contain, redondo: true),
                  ),
                  Expanded(
                      child: Text(lista[index].nome,
                          style: const TextStyle(fontSize: 18)
                      )
                  ),

                  const Icon(Icons.arrow_forward_ios),
                ],
              )
          ),
        );
      },
    );
  }

  void _abrirItem(BuildContext context, Time time) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => TimePage(time)
    )
    );
  }
}
