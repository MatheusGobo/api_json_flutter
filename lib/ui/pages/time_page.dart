import 'package:aula_02_api_json/ui/components/imagem.dart';
import 'package:flutter/material.dart';

class TimePage extends StatelessWidget {
  final Map<String, dynamic> dados;

  const TimePage(this.dados, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Imagem(
                  linkImage: dados["Tim_Bandeira"].toString(),
                  boxfit: BoxFit.cover,
                  height: 30,
                  width: 50
              )
            ),
            Text(dados['Tim_Nome'])
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Imagem(linkImage: dados["Tim_Bandeira"].toString(), boxfit: BoxFit.cover)
        ],
      ),
    );
  }
}
