import 'package:flutter/material.dart';

class Imagem extends StatelessWidget {
  final String linkImage;
  final BoxFit boxfit;
  final double? height;
  final double? width;

  const Imagem({required this.linkImage, required this.boxfit, this.height, this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(
        linkImage.replaceAll("~/", "http://controle.mdvsistemas.com.br/"),
        height: height,
        width: width,
        fit: boxfit);
  }
}
