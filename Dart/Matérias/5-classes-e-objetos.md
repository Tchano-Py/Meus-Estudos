# Classes e Objetos
Uma classe é como uma planta — um molde que define propriedades (campos) e comportamentos (métodos) de algo que queremos representar.

Um objeto é uma instância dessa classe — algo concreto criado a partir do molde.

Em Dart, tudo é objeto: números, funções, `null`, etc., e todos herdam de Object, exceto `Null`.

## Estruturas Essenciais de Classes 
1. Declaração da Classe
```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  void apresentar() {
    print("Oi, eu sou $nome e tenho $idade anos.");
  }
}
```
* Campos (`instance variables`): armazenam dados — `nome`, `idade`,
* Construtor: inicializa o objeto — `Pessoa(this.nome, this.idade)`,
* Método: define comportamento — `apresentar()`,

2. Criando Instâncias e Acessando Membros
```dart
void main() {
  var p = Pessoa("Tchano", 25);     // 'new' é opcional
  p.apresentar();               // Oi, eu sou Tchano e tenho 25 anos.
}
```
Use o operador `.` para acessar campos e métodos.

3. Getters, Setters e Encapsulamento
Variáveis privadas começam com underscore `_`. Use getters/setters para controle:
```dart
class ContaBancaria {
  double _saldo = 0; // privado

  double get saldo => _saldo; // getter
  set depositar(double valor) {
    if (valor > 0) _saldo += valor;
  }
}

void main() {
  var conta = ContaBancaria();
  conta.depositar = 100;
  print(conta.saldo); // 100
}
```

4. Herança (Reuso de Código)
Uma classe pode herdar atributos e métodos de outra classe usando extends.
```dart
class Animal {
  void dormir() => print("O animal está dormindo.");
}

class Cachorro extends Animal {
  void latir() => print("Au au!");
}

void main() {
  var dog = Cachorro();
  dog.dormir(); // herdado
  dog.latir();  // específico
}
```

5. Polimorfismo
O polimorfismo permite que classes diferentes respondam de formas diferentes ao mesmo método. Ou seja, várias classes podem compartilhar o mesmo "nome de função", mas cada uma implementa à sua maneira.
```dart
class Forma {
  void desenhar() => print("Desenhando uma forma...");
}

class Circulo extends Forma {
  @override
  void desenhar() => print("Desenhando um círculo...");
}

class Quadrado extends Forma {
  @override
  void desenhar() => print("Desenhando um quadrado...");
}

void main() {
  List<Forma> formas = [Circulo(), Quadrado(), Forma()];

  for (var f in formas) {
    f.desenhar();
  }
  // Saída:
  // Desenhando um círculo...
  // Desenhando um quadrado...
  // Desenhando uma forma...
}
```
Útil quando queremos generalizar código e deixar que cada classe trate o detalhe.

6. Abstração
A abstração serve para definir um contrato que outras classes devem seguir. Classes abstratas não podem ser instanciadas diretamente.
```dart
abstract class Animal {
  void som(); // método abstrato: não tem corpo
}

class Gato extends Animal {
  @override
  void som() => print("Miau!");
}

class Cachorro extends Animal {
  @override
  void som() => print("Au au!");
}

void main() {
  List<Animal> animais = [Gato(), Cachorro()];
  for (var a in animais) {
    a.som();
  }
  // Saída:
  // Miau!
  // Au au!
}
```
Usamos quando queremos definir regras que todas as subclasses devem cumprir.

7. Interfaces & Implements
Em Dart, toda classe pode servir como interface. Quando usamos implements, obrigamos a classe a seguir o contrato exatamente.
```dart
class Forma {
  void desenhar() {}
}

class Triangulo implements Forma {
  @override
  void desenhar() => print("Desenhando um triângulo...");
}

void main() {
  Forma t = Triangulo();
  t.desenhar(); // Desenhando um triângulo...
}
```
Útil para garantir que classes diferentes usem os mesmos métodos.

8. Extensões (Extension Methods)
Permite adicionar métodos a classes existentes, mesmo sem mexer nelas. Isso é ótimo quando queremos criar funções extras em tipos já prontos (como String, int, DateTime, etc.).
```dart
extension StringExt on String {
  bool get isUpperCase => this == toUpperCase();
  String saudacao() => "Olá, $this!";
}

void main() {
  print("DART".isUpperCase); // true
  print("Cristiano".saudacao()); // Olá, Cristiano!
}
```
Útil para deixar o código mais legível e evitar duplicação de funções.

9. Classes Anônimas
São classes sem nome, úteis para estruturas simples quando não precisamos criar uma classe inteira. No Dart, geralmente usamos funções anônimas ou objetos literais.
```dart
void main() {
  var pessoa = {"nome": "Carlos", "idade": 20};

  print(pessoa); // {nome: Carlos, idade: 20}
  print(pessoa["nome"]); // Carlos
}
```

## Fontes em PT/EN:

- [Classes](https://dart.dev/language/classes)
- [Dart - Classes And Objects](https://www.geeksforgeeks.org/dart/dart-classes-and-objects/)
- [Objects Dart: Understanding Classes, Instances, and Methods](https://www.dhiwise.com/post/objects-dart-understanding-classes-instances-and-methods)
- [Dart | Classes](https://www.codecademy.com/resources/docs/dart/classes)
- [Dart OOP Part 2](https://medium.com/@wafiqmuhaz/dart-oop-class-object-field-method-method-expression-body-and-extension-method-dart-oop-ab54e15b4845)
- [Dart OOP Part 1](https://medium.com/@wafiqmuhaz/complete-oop-guide-for-dart-concepts-principles-and-benefits-ab0756674317)