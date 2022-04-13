import 'package:aula_02_api_json/models/models.dart';
import 'package:aula_02_api_json/ui/components/components.dart';
import 'package:flutter/material.dart';

class TimePage extends StatelessWidget {
  final Time time;

  const TimePage(this.time, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(time.nome),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Imagem(linkImage: time.bandeira, boxfit: BoxFit.cover, redondo: false)
        ],
      ),
    );
  }
}
