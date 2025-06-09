class CalculadoraModel {
  String entrada = '';
  String resultado = '';

  void limpar() {
    entrada = '';
    resultado = '';
  }

  void adicionar(String valor) {
    entrada += valor;
  }

  void calcular() {
    try {
      final expressao = entrada.replaceAll('×', '*').replaceAll('÷', '/');
      resultado = '= ${_avaliarExpressao(expressao)}';
    } catch (e) {
      resultado = 'Erro';
    }
  }

  double _avaliarExpressao(String expr) {
    List<String> tokens = _tokenizar(expr);
    List<String> posfixa = _paraPosfixa(tokens);
    return _avaliarPosfixa(posfixa);
  }

  List<String> _tokenizar(String expr) {
    final tokens = <String>[];
    final buffer = StringBuffer();

    for (int i = 0; i < expr.length; i++) {
      String c = expr[i];
      if ('0123456789.'.contains(c)) {
        buffer.write(c);
      } else if ('+-*/'.contains(c)) {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        tokens.add(c);
      }
    }

    if (buffer.isNotEmpty) {
      tokens.add(buffer.toString());
    }

    return tokens;
  }

  int _precedencia(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
  }

  List<String> _paraPosfixa(List<String> tokens) {
    final saida = <String>[];
    final pilha = <String>[];

    for (var token in tokens) {
      if ('+-*/'.contains(token)) {
        while (pilha.isNotEmpty &&
            _precedencia(pilha.last) >= _precedencia(token)) {
          saida.add(pilha.removeLast());
        }
        pilha.add(token);
      } else {
        saida.add(token);
      }
    }

    while (pilha.isNotEmpty) {
      saida.add(pilha.removeLast());
    }

    return saida;
  }

  double _avaliarPosfixa(List<String> posfixa) {
    final pilha = <double>[];

    for (var token in posfixa) {
      if ('+-*/'.contains(token)) {
        final b = pilha.removeLast();
        final a = pilha.removeLast();

        switch (token) {
          case '+':
            pilha.add(a + b);
            break;
          case '-':
            pilha.add(a - b);
            break;
          case '*':
            pilha.add(a * b);
            break;
          case '/':
            pilha.add(a / b);
            break;
        }
      } else {
        pilha.add(double.parse(token));
      }
    }

    return pilha.last;
  }
}
