void main(){
  print("------------------------------------------------------------------------");
  print("Exercício Fácil: Crie um programa que: Peça ao usuário um número (simule com var input = 'abc';). Tente converter o valor em inteiro usando int.parse(). Se der erro, capture a exceção (FormatException) e exiba: Valor inválido, digite apenas números.");
  var input = 'abc';

  try {
    int numero = int.parse(input);
    print("Número válido: $numero");
  } on FormatException {
    print("Valor inválido, digite apenas números.");
  }

  print("------------------------------------------------------------------------");
  print("Exercício Médio: Implemente uma função chamada dividir(a, b) que: Recebe dois inteiros. Retorna o resultado de a / b. Se b == 0, lança uma exceção com throw dizendo 'Divisão por zero não é permitida.'. No main(), trate essa exceção e exiba a mensagem amigável.");
  int dividir(int a, int b) {
    if (b == 0) {
      throw Exception('Divisão por zero não é permitida.');
    }
    return a ~/ b; // Divisão inteira
  }

  try {
    int resultado = dividir(10, 0);
    print("Resultado: $resultado");
  } catch (e) {
    print(e);
  }

  print("------------------------------------------------------------------------");
  print("Exercício Difícil: Implemente um programa que simule o processamento de pedidos: Crie uma função processarPedido(String pedido) que: Lança uma exceção se pedido for vazio (''), usando throw. Tente converter o pedido em número (int.parse(pedido)), e se falhar, capture a exceção (FormatException), exiba 'Erro: pedido inválido', e use rethrow para repassar. No main(): Chame processarPedido dentro de um try-catch. Trate qualquer erro não tratado antes e mostre:");
  void processarPedido(String pedido) {
    if (pedido.isEmpty) {
      throw Exception('Pedido não pode ser vazio.');
    }

    try {
      int numeroPedido = int.parse(pedido);
      print("Processando pedido número: $numeroPedido");
    } on FormatException {
      print("Erro: pedido inválido.");
      rethrow;
    }
  }

  try {
    processarPedido(''); // Teste com pedido vazio
  } catch (e) {
    print("Erro ao processar pedido: $e");
  }
}