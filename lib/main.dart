import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/calculadora_viewmodel.dart';
import 'views/calculadora_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CalculadoraViewModel())],
      child: AplicativoCalculadora(),
    ),
  );
}

class AplicativoCalculadora extends StatelessWidget {
  const AplicativoCalculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Wear OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculadoraScreen(),
    );
  }
}
