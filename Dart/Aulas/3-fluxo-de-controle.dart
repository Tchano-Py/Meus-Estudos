void main() {
  // Exercício Fácil: Peça ao usuário (ou defina no código) um número inteiro e diga se ele é par ou ímpar usando isEven e isOdd.
  int numero = 2;
  if (numero.isEven) {
    print("O número $numero é par.");
  } else {
    print("O número $numero é ímpar.");
  }

  /// Definição das propriedades
  /// isEven: Retorna true se o número for par.
  /// isOdd: Retorna true se o número for ímpar.
  /// isNegative: Retorna true se o número for negativo.
  /// isPositive: Retorna true se o número for positivo.
  /// isNaN: Retorna true se o número não for um número (Not a Number).
  /// isInfinite: Retorna true se o número for infinito.
  /// isFinite: Retorna true se o número for finito.

  // Exercício Médio: Dada uma lista de números, percorra todos os elementos e mostre apenas os números pares.
  List<int> numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  List<int> numerosPares = [];

  for (int numero in numeros) {
    if (numero.isEven) {
      numerosPares.add(numero);
    }
  }

  print("Números pares: $numerosPares");

  // Exercício Difícil: Crie um programa que receba uma lista de números e conte: Quantos números pares existem, Quantos números ímpares existem
  int contagemPares = 0;
  int contagemImpares = 0;

  for (int numero in numeros) {
    if (numero.isEven) {
      contagemPares++;
    } else {
      contagemImpares++;
    }
  }

  print("Quantidade de números pares: $contagemPares");
  print("Quantidade de números ímpares: $contagemImpares");
}
