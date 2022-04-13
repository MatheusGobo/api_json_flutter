import 'package:flutter/material.dart';

class CirculoEspera extends StatelessWidget {
  const CirculoEspera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
            Text('Aguarde...', style: TextStyle(fontSize: 18),)
          ],
        )
      ),
    );
  }
}
