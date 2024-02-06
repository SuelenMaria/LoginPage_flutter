import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:login/screams/text_page.dart';
// ignore: unused_import
import 'package:login/screams/criar_conta.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Digite os dados de acesso.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                CupertinoTextField(
                  controller: _emailController,
                  cursorColor: Colors.pinkAccent,
                  padding: EdgeInsets.all(15),
                  placeholder: "Digite o seu e-mail",
                  placeholderStyle:
                      TextStyle(color: Colors.white70, fontSize: 14),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      )),
                ),
                const SizedBox(height: 5),
                CupertinoTextField(
                  controller: _passwordController,
                  padding: EdgeInsets.all(15),
                  cursorColor: Colors.pinkAccent,
                  placeholder: "Digite sua senha",
                  obscureText: true,
                  placeholderStyle:
                      TextStyle(color: Colors.white70, fontSize: 14),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Adicione sua lógica de autenticação aqui

                        if (email == 'usuario@example.com' &&
                            password == 'senha123') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TextPage()),
                          );
                        } else {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: Text('Erro de autenticação'),
                              content: Text('Credenciais inválidas'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
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
                        decoration:
                            TextDecoration.underline, // Adiciona sublinhado
                        fontWeight: FontWeight
                            .normal, // Pode ajustar conforme necessário
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
