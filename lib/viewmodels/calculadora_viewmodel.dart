import 'package:flutter/material.dart';
import '../models/calculadora_model.dart';

class CalculadoraViewModel extends ChangeNotifier {
  final CalculadoraModel _calculadora = CalculadoraModel();

  String get entrada => _calculadora.entrada;
  String get resultado => _calculadora.resultado;

  void adicionar(String valor) {
    _calculadora.adicionar(valor);
    notifyListeners();
  }

  void limpar() {
    _calculadora.limpar();
    notifyListeners();
  }

  void calcular() {
    _calculadora.calcular();
    notifyListeners();
  }
}
