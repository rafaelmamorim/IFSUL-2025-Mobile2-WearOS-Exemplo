
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/calculadora_viewmodel.dart';

class CalculadoraScreen extends StatelessWidget {
  const CalculadoraScreen({super.key});

  Widget _construirBotao(BuildContext context, String texto, {Color? cor}) {
    return SizedBox(
      width: 36,
      height: 36,
      child: ElevatedButton(
        onPressed: () {
          final viewModel = Provider.of<CalculadoraViewModel>(
            context,
            listen: false,
          );
          if (texto == 'C') {
            viewModel.limpar();
          } else if (texto == '=') {
            viewModel.calcular();
          } else {
            viewModel.adicionar(texto);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: cor ?? Colors.blueGrey,
          shape: CircleBorder(),
          padding: EdgeInsets.all(1),
        ),
        child: Text(texto, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculadoraViewModel>(context);

    final botoes = [
      '7','8','9','÷',
      '4','5','6','×',
      '1','2','3','-',
      'C','0','.','+', '=',
    ];

    final cores = {
      '+': Colors.orange,
      '-': Colors.orange,
      '×': Colors.orange,
      '÷': Colors.orange,
      'C': Colors.red,
      '=': Colors.green,
      '.': Colors.grey,
    };

    return Scaffold(
      body: SafeArea(
        child: ClipOval(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 1),
                Text(viewModel.entrada, style: TextStyle(fontSize: 12)),
                Text(
                  viewModel.resultado,
                  style: TextStyle(fontSize: 13, color: Colors.green),
                ),
                SizedBox(height: 1),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 25,
                    childAspectRatio: 1,
                    physics: NeverScrollableScrollPhysics(),
                    children: botoes.map((texto) {
                      return _construirBotao(
                        context,
                        texto,
                        cor: cores[texto],
                      );
                    }).toList(),
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
