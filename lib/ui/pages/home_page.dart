import 'dart:convert';
import 'package:aula_02_api_json/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<dynamic>> _getLista() async{
    String link = 'http://controle.mdvsistemas.com.br/Esportes/Times/GetTime';

    var response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sports_soccer),
            Text('Times de Futebol - API'),
          ],
        )
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: _getLista(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                      );
                    default:
                      if (snapshot.hasError) {
                        return Text('Erro ao Acessar a API (${snapshot.error.toString()})');
                      }
                      else {
                        return _criarListagem(context: context, snapshot: snapshot);
                      }
                  }
                }
            )
          )

        ],
      ),
    );
  }

  Widget _criarListagem(
      {required BuildContext context, required AsyncSnapshot snapshot}) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _abrirItem(snapshot.data[index]);
            },
          child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ClipOval(
                        child: Image.network(
                            snapshot.data[index]["Tim_Bandeira"].toString().replaceAll(
                                "~/", "http://controle.mdvsistemas.com.br/"),
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover)
                    ),
                  ),
                  Expanded(
                      child: Text(snapshot.data[index]["Tim_Nome"],
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

  void _abrirItem(Map<String, dynamic> dados) {
    Navigator.push(context, MaterialPageRoute(
          builder: (context) => TimePage(dados)
        )
    );
  }
}
