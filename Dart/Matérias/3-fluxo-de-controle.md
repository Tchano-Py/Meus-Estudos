# Fluxo de Controle em Dart

O **fluxo de controle** em uma linguagem de programação é a forma como o **código decide o que executar e em que ordem**.

No Dart (assim como em outras linguagens), o código **não é sempre executado linha por linha de cima para baixo**. Dependendo de condições, repetições ou erros, a execução pode **mudar de caminho**:

- **Estruturas de decisão**: executar algo somente se uma condição `fo`r verdadeira (`if`, `switch`).
- **Repetir ações**: rodar um bloco várias vezes (`for`, `while`, `do-while`).
- **Tratar erros**: capturar exceções e evitar que o programa quebre (`try-catch-finally`).
- **Interromper ou pular execuções**: sair de um loop (`break`) ou pular para a próxima iteração (`continue`).

1. Estruturas de Decisão – `if` / `else` / `else if`
   Permitem executar blocos de código diferentes com base em condições.

```dart
if (condicao) {
  // executa se condicao for verdadeira
} else if (outraCondicao) {
  // executa se outra condição for verdadeira
} else {
  // executa caso nenhuma condição seja verdadeira
}
```

`if-case` (Dart 3+)
Permite usar padrões (patterns) dentro do `if` para comparar e extrair dados de estruturas como listas ou objetos. Isso facilita quando queremos verificar o tipo ou o valor de algo.

```dart
Object dado = "Cristiano";

if (dado case String nome) {
    print("O valor é um texto: $nome");
} else if (dado case int numero) {
    print("O valor é um número: $numero");
}
```

Aqui, o Dart testa o tipo do valor e já cria uma variável (`nome`, `numero`) automaticamente.

`switch`
Estrutura clássica para múltiplas ramificações, com suporte avançado a padrões desde o Dart 3. Além disso, há a exhaustiveness checking — o compilador avisa se algum caso possível não foi coberto.

```dart
String cor = "vermelho";
switch (cor) {
    case "azul":
      print("A cor é azul");
      break;
    case "vermelho":
      print("A cor é vermelha");
      break;
    default:
      print("Cor desconhecida");
  }
```

O switch compara o valor e executa o case correspondente.

`switch expression` (Dart 3+):
É um switch mais curto e moderno, usado como expressão (retorna um valor).

```dart
String dia = "sábado";

String tipoDia = switch (dia) {
    "sábado" || "domingo" => "Fim de semana",
    "segunda" || "terça" || "quarta" || "quinta" || "sexta" => "Dia útil",
    _ => "Dia inválido"
};

print(tipoDia);
```

`when` (condição extra no `switch`)
Permite adicionar condições mais detalhadas dentro de um `case`. O `when` só deixa o case ser executado se a condição extra for verdadeira.

```dart
int numero = 12;

switch (numero) {
    // isEven - Retorna true se o número for par.
    case var n when n.isEven:
      print("O número $n é par");
      break;
    // isOdd - Retorna true se o número for ímpar.
    case var n when n.isOdd:
      print("O número $n é ímpar");
      break;
    default:
      print("Não sei o que fazer");
}
```

## Fontes em PT/EN:

- [Branches](https://dart.dev/language/branches)
- [Controle de Fluxo no Dart](https://www.youtube.com/watch?v=pIbquX6earI)
- [Linguagem Dart: Controle de Fluxo](https://www.devmedia.com.br/linguagem-dart-controle-de-fluxo/40758)
