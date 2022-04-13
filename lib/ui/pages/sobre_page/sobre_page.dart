import 'package:aula_02_api_json/ui/components/components.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        centerTitle: true,
      ),
        body: ListView(
            children: const [
              Imagem(linkImage: 'images/BW.JPG', boxfit: BoxFit.contain, redondo: false)
            ],
          ),
    );
  }
}
