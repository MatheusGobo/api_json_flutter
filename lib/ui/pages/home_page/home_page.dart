import 'package:aula_02_api_json/datasources/datasources.dart';
import 'package:aula_02_api_json/models/models.dart';
import 'package:aula_02_api_json/ui/components/components.dart';
import 'package:aula_02_api_json/ui/pages/home_page/widgets/widgets.dart';
import 'package:aula_02_api_json/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* //Jeito antigo, direto na HomePage
  Future<List<dynamic>> _getLista() async{
    String link = 'http://controle.mdvsistemas.com.br/Esportes/Times/GetTime';

    var response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }*/

  void _abrirSobre() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => SobrePage()));

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
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined)
          ),
          IconButton(
              onPressed: _abrirSobre,
              icon: const Icon(Icons.help_outline)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: TimeRemote().get(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CirculoEspera();
                    default:
                      if (snapshot.hasError) {
                        return GestureDetector(
                          child: MensagemErro('Erro ao Acessar a API (${snapshot.error.toString()})'),
                          onTap: () {setState(() {}); },
                        );
                      }
                      else {
                        return ListaTime(lista: snapshot.data as List<Time>);
                      }
                  }
                }
            )
          )

        ],
      ),
    );
  }
}
