![IFSUL Banner](IFSul-banner.jpg)

# Calculadora Wear OS em Flutter

Este repositório apresenta uma calculadora simples desenvolvida em Flutter, com foco em dispositivos Wear OS (tela circular), utilizando o padrão MVVM (Model-View-ViewModel) e o pacote [`provider`](https://pub.dev/packages/provider) para gerenciamento de estado.

## Sobre o projeto

A aplicação permite realizar operações matemáticas básicas (adição, subtração, multiplicação e divisão) em uma interface otimizada para relógios inteligentes com tela circular. O layout foi cuidadosamente ajustado para garantir que todos os botões fiquem visíveis e acessíveis, respeitando os limites da tela.

## Principais características

- Interface adaptada para Wear OS (tela circular)
- Operações básicas: +, -, ×, ÷
- Layout responsivo com `GridView`
- Gerenciamento de estado com Provider e padrão MVVM
- Código totalmente em português

## Como usar este exemplo

1. Instale as dependências com `flutter pub get`.
2. Execute o app em um emulador ou dispositivo Wear OS.
3. Utilize os botões da interface para realizar cálculos.
4. O resultado será exibido logo abaixo da expressão digitada.

## Estrutura do projeto

- `lib/models/calculadora_model.dart`: Lógica dos cálculos.
- `lib/viewmodels/calculadora_viewmodel.dart`: Gerenciamento de estado.
- `lib/views/calculadora_screen.dart`: Interface do usuário.

## Links úteis

- [Documentação do Flutter](https://docs.flutter.dev/)
- [Provider no pub.dev](https://pub.dev/packages/provider)
- [Desenvolvimento para Wear OS com Flutter](https://docs.flutter.dev/development/platform-integration/android/wear)

---

Este projeto foi desenvolvido para fins didáticos no IFSUL.
