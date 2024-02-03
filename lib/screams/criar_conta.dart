import 'package:flutter/material.dart';
import 'package:login/screams/login_page.dart';

class CriarConta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar sua Conta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à tela de criação de conta!'),
            // Adicione aqui os campos e elementos necessários para a criação de conta
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
