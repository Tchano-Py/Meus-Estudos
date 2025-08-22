# Tratamento de Erros em Dart

O tratamento de erros no Dart é o mecanismo que permite que seu programa lide com situações inesperadas — ou seja, exceções — de forma controlada, evitando falhas abruptas e melhorando a robustez do código. Em vez de o programa "quebrar" em tempo de execução, você pode interceptar o erro e reagir adequadamente.

## Estrutura Básica: `try`, `on`, `catch`, `finally`

Você envolve o código potencialmente problemático no bloco `try`, seguido por:

* `on TipoDeException`: trata apenas exceções de um tipo específico.
* `catch (e)`: captura a exceção em uma variável para tratar de forma genérica ou inspecionar o erro.
* `catch (e, s)`: além da exceção, captura também a `StackTrace`, útil para debugging.
* `finally`: sempre executado após `try` e `catch`, ideal para tarefas de limpeza (por exemplo, fechar arquivos, conexões, etc.)

> O StackTrace é um rastro da pilha de execução no momento em que o erro aconteceu. Ou seja, ele mostra a sequência de chamadas de funções que levaram até o ponto onde a exceção foi lançada.

```dart
void main() {
  try {
    dividir(10, 0);
  } catch (e, stack) {
    print('Erro: $e');
    print('StackTrace: $stack');
  }
}

void dividir(int a, int b) {
  // Força um erro de divisão por zero
  int resultado = a ~/ b;
  print("Resultado: $resultado");
}

// saída
Erro: IntegerDivisionByZeroException
StackTrace: #0      dividir (file:///main.dart:10:20) #1      main (file:///main.dart:4:5)
```

```dart
try {
  int resultado = 12 ~/ 0;
  print('Resultado: $resultado');
} on IntegerDivisionByZeroException {
  print('Não é possível dividir por zero.');
} catch (e, s) {
  print('Erro: $e');
  print('StackTrace:\n$s');
} finally {
  print('Bloco finally executado.');
}
```

## Sobre `throw` e Exceções Personalizadas

* A palavra-chave `throw` serve para lançar (disparar) uma exceção manualmente.
* As exceções em Dart são objetos que geralmente herdam da `classe` `Exception`.
* Você pode criar exceções personalizadas para tratar situações específicas do seu domínio de negócio. Exemplo:

```dart
class IdadeInvalidaException implements Exception {
  String toString() => 'Idade inválida: menor que o permitido.';
}

void verificarIdade(int idade) {
  if (idade < 18) throw IdadeInvalidaException();
}

void main() {
  try {
    verificarIdade(15);
  } catch (e) {
    print(e); // Exceção personalizada
  }
}
```

## Tipos de Exceções em Dart


| Tipo de Exceção                  | Descrição                                                                                          | Exemplo                                                                                                                                                                                                                               |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **FormatException**                | Lançada quando há um erro de formatação, como tentar converter uma`String` inválida em número. | `dart\nvoid main() {\n  try {\n    int numero = int.parse('abc');\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n`                                                                                                                 |
| **IntegerDivisionByZeroException** | Ocorre quando se tenta dividir um número inteiro por zero (`~/`).                                   | `dart\nvoid main() {\n  try {\n    var resultado = 10 ~/ 0;\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n`                                                                                                                       |
| **UnsupportedError**               | Lançada quando uma operação não é suportada.                                                    | `dart\nvoid main() {\n  try {\n    var lista = [1, 2, 3];\n    lista.length = -1; // Não suportado\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n`                                                                               |
| **RangeError**                     | Ocorre quando um índice está fora do intervalo válido de uma lista/coleção.                     | `dart\nvoid main() {\n  try {\n    var lista = [1, 2, 3];\n    print(lista[5]);\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n`                                                                                                   |
| **StateError**                     | Quando o estado de um objeto não permite uma operação.                                            | `dart\nvoid main() {\n  try {\n    var iterator = [].iterator;\n    print(iterator.current); // Estado inválido\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n`                                                                  |
| **ArgumentError**                  | Quando um argumento inválido é passado para uma função.                                          | `dart\nvoid verificarIdade(int idade) {\n  if (idade < 0) {\n    throw ArgumentError('Idade não pode ser negativa.');\n  }\n}\n\nvoid main() {\n  try {\n    verificarIdade(-5);\n  } catch (e) {\n    print('Erro: $e');\n  }\n}\n` |
| **OutOfMemoryError**               | Quando a aplicação fica sem memória (raro em Dart).                                               | Normalmente ocorre em**cenários extremos** (não é comum em exemplos simples).                                                                                                                                                      |

## Palavras-chave Especiais: `throw`, `rethrow` e `assert`

No Dart, você pode lançar (`throw`) uma exceção quando acontece algo inesperado no código.  Dart já traz várias exceções prontas (como vimos na tabela). Você pode lançá-las diretamente usando `throw` por exemplo `throw IdadeInvalidaException()`.

Às vezes, você precisa de uma exceção específica para a sua regra de negócio. Para isso, cria-se uma classe que implementa `Exception`.

Se você quiser capturar uma exceção, mas ainda assim deixá-la propagar para cima, pode usar `rethrow`.

```dart
void processarDados() {
  try {
    int.parse("abc"); // Erro
  } catch (e) {
    print("Erro capturado, mas vou relançar...");
    rethrow;
  }
}

void main() {
  try {
    processarDados();
  } catch (e) {
    print("Erro chegou até o main: $e");
  }
}
```

O `assert` é uma verificação usada em tempo de desenvolvimento (`debug mode`). Ele serve para garantir que uma condição seja verdadeira durante a execução. Se a condição for falsa, o programa lança um `AssertionError` e para imediatamente. No modo de produção (`release mode`), os `assert` são ignorados.

```dart
void main() {
  int idade = 15;

  // Verifica se a idade é maior ou igual a 18
  assert(idade >= 18, "A idade deve ser maior ou igual a 18");

  print("Idade válida: $idade");
}
```

Como `idade = 15`, o assert vai falhar e lançar um `AssertionError`:

```perl
Unhandled exception:
'file.dart': Failed assertion: line 5 pos 3: 'idade >= 18': A idade deve ser maior ou igual a 18
```

### Resumo


| Recurso     | Quando usar                                                                                                                                                               |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **assert**  | Durante o **desenvolvimento**, para validar **pré-condições** e encontrar erros mais cedo. É ignorado no modo produção.                                            |
| **throw**   | Para **lançar exceções** que devem ser tratadas pelo código em execução real (produção). Exemplo: lançar um `FormatException` se um input for inválido.          |
| **rethrow** | Usado dentro de um`catch` quando você **captura uma exceção mas quer lançá-la novamente** para que outro nível do código trate. Mantém o **StackTrace original**. |

## Fontes em PT/EN:

- [Error handling](https://dart.dev/language/error-handling)
- [Exception Handling in Dart](https://www.geeksforgeeks.org/dart/exception-handling-in-dart/)
- [Dart Throw: How to Effectively Handle Errors and Exceptions](https://www.dhiwise.com/post/dart-throw-how-to-effectively-handle-errors-and-exceptions)
- [Dart - Types of Exceptions](https://www.geeksforgeeks.org/dart/dart-types-of-exceptions/)
