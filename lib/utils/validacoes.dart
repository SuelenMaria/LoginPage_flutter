class Validacoes {
  static bool validarCampos(String login, String senha) {
    // Verificar e alertar se ambos os campos de login e senha estão preenchidos
    if (login.isEmpty || senha.isEmpty) {
      _mostrarAlerta("Ambos os campos devem ser preenchidos.");
      return false;
    }

    // Verificar se a senha tem pelo menos dois caracteres
    if (senha.length < 2) {
      _mostrarAlerta("A senha deve ter pelo menos dois caracteres.");
      return false;
    }

    // Verificar se a senha não tem caracteres especiais
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senha)) {
      _mostrarAlerta("A senha não pode ter caracteres especiais.");
      return false;
    }

    // Verificar se os campos não ultrapassam 20 caracteres
    if (login.length > 20 || senha.length > 20) {
      _mostrarAlerta("Os campos não podem ultrapassar 20 caracteres.");
      return false;
    }

    // Verificar se os campos não terminam com espaços no final
    if (login.endsWith(' ') || senha.endsWith(' ')) {
      _mostrarAlerta("Os campos não podem terminar com espaços no final.");
      return false;
    }

    // Se todas as verificações passarem, retorna true
    return true;
  }

  static void _mostrarAlerta(String mensagem) {
    // Função para mostrar um alerta
    // ...
  }
}
