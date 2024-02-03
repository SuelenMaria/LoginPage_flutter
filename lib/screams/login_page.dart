import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:login/screams/text_page.dart';
// ignore: unused_import
import 'package:login/screams/criar_conta.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Preencha os campos abaixo.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const CupertinoTextField(
              cursorColor: Colors.pinkAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Digite o seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              padding: EdgeInsets.all(15),
              cursorColor: Colors.pinkAccent,
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  )),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.greenAccent,
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TextPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 0.8),
                  borderRadius: BorderRadius.circular(7)),
              child: CupertinoButton(
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  // Navegar para a tela de criação de conta
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CriarConta()),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () => _abrirPoliticaDePrivacidade(),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Política de Privacidade',
                  style: TextStyle(
                    color: Colors.blue, // Cor do texto como a de um link
                    decoration: TextDecoration.underline, // Adiciona sublinhado
                    fontWeight:
                        FontWeight.normal, // Pode ajustar conforme necessário
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_abrirPoliticaDePrivacidade() async {
  const url = 'https://www.google.com.br'; // URL desejada
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir a URL: $url';
  }
}
