import 'package:flutter/material.dart';
import 'package:login/screams/login_page.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem Vindo'),
      ),
      body: Center(
        child: Text('Como posso ajudar?'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
