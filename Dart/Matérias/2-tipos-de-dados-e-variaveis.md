# Tipos de dados e variáveis

### O que é uma variável?

Uma variável é como uma "**caixa**" onde você pode guardar informações temporariamente na memória do computador. Assim como você pode colocar diferentes objetos numa caixa real, numa variável você pode armazenar diferentes tipos de dados.

No Dart, toda variável se refere a um objeto, uma instância de uma classe `Built-in types`. Isso significa que tudo no Dart é um objeto, incluindo números, strings e até mesmo `null`.

> `Built-in types` significa "tipos incorporados" ou "tipos nativos" da linguagem.

### Como funcionam as variáveis?

Imagine que você tem várias caixas etiquetadas:

* Uma caixa chamada "*idade*" onde você guarda o número **25**
* Uma caixa chamada "*nome*" onde você guarda o texto "**Maria**"
* Uma caixa chamada "*altura*" onde você guarda o número **1.65**

### Características principais:

1. Nome (identificador): Cada variável precisa ter um nome único para você poder encontrá-la depois. É como a etiqueta da caixa.
2. Valor: É o conteúdo que está guardado dentro da variável no momento.
3. Tipo: Define que tipo de informação pode ser armazenada (números, texto, verdadeiro/falso, etc.).

A linguagem Dart tem suporte especial para o seguinte:

1. Numbers (Números)
   O Dart tem dois tipos de números:

   * int (Inteiros):

   ```dart
   int ano = 2025
   var idade = 25;                  // Número inteiro
   var hex = 0xDEADBEEF;            // Hexadecimal
   var telefone = 555_123_4567;     // Com separadores para legibilidade
   ```

   * double (Decimais):

   ```dart
   double peso = 55.5
   var altura = 1.75;               // Número decimal
   var cientifico = 1.42e5;         // Notação científica
   ```

   * num (Genérico):

   ```dart
   num x = 1;           // Pode receber int ou double
   x += 2.5;            // Agora é double
   ```
2. String (Texto)
   Uma string do Dart contém uma sequência de unidades de código **UTF-16** `Built-in types`:

   ```dart
   String nome = 'Tchano';
   var sobrenome = "Py";
   ```
3. bool (Booleano)
   Apenas dois objetos têm tipo bool: os literais booleanos `true` e `false` `Built-in types`:

   ```dart
   bool ativo = true;
   var inativo = false;
   var temIdade = idade >= 18;  // Resultado de comparação
   ```
4. Collections (Coleções)
   **Collections** são estruturas de dados que permitem **armazenar múltiplos valores** em uma única variável. É como ter diferentes tipos de "recipientes" para organizar seus dados.

   * List (Listas/Arrays): Uma sequência ordenada de elementos onde:
     ✅ Permite elementos duplicados
     ✅ Os elementos têm posição/índice (0, 1, 2, 3...)
     ✅ Mantém a ordem de inserção

   ```dart
   // Lista de nomes
   var frutas = ['maçã', 'banana', 'laranja'];

   // Lista de números
   var numeros = <int>[1, 2, 3, 4, 5];
   ```

   * Set (Conjuntos): Uma coleção única de elementos onde:
     ❌ NÃO permite duplicatas
     ❌ NÃO garante ordem específica
     ✅ Ideal para elementos únicos

   ```dart
   // Set de cores
   var cores = {'vermelho', 'azul', 'verde'};

   // Set de números únicos
   var numerosUnicos = <int>{1, 2, 3, 2, 1};
   ```

   * Map (Mapas/Dicionários): Uma coleção de pares chave-valor onde:
     ✅ Cada chave é única
     ✅ Cada chave aponta para um valor
     ✅ Como um dicionário (palavra → significado)

   ```dart
   // Map de pessoa
   var pessoa = {
   'nome': 'Tchano',
   'idade': 30,
   'ativa': true
   };

   // Map tipado
   Map<String, int> idades = {
   'João': 25,
   'Maria': 30,
   'Ana': 28
   };
   ```

### Como as Variáveis se Comportam no Dart

1. Declaração e Inferência de Tipo

   ```dart
   // O Dart infere automaticamente o tipo
   var nome = 'Tcahno-Py';   // String
   var idade = 25;           // int
   var altura = 1.75;        // double

   // Ou você pode especificar explicitamente
   String cidade = 'Luanda';
   int populacao = 500000;
   ```
2. Conversões entre Tipos

   ```dart
   // String para número
   var um = int.parse('1');
   var umPontoUm = double.parse('1.1');

   // Número para string
   String umTexto = um.toString();                     // "1"
   String umPontoUmTexto = altura.toStringAsFixed(2);  // "1.10"
   ```
3. Constantes
   Literais numéricos são constantes de tempo de compilação Built-in types.

   ```dart
   const segundosPorMinuto = 60;
   const minutosPorHora = 60;
   const segundosPorHora = segundosPorMinuto * minutosPorHora;
   ```
4. Null Safety
   A linguagem Dart impõe null safety sólido Variables. Isso previne erros de acesso não intencional a variáveis definidas como null.

   > *ATT 1:* NULLABLE - Pode ser null e NON-NULLABLE - Nunca pode ser null.
   > *ATT 2:* Variáveis não inicializadas que têm tipo nullable têm valor inicial null `Variables`.

   ```dart
   void main() {
    String? nomeOpcional;               // null por padrão
    String nomeObrigatorio = 'Tchano';  // DEVE ser inicializado
    
    // ❌ ERRO - não pode acessar propriedades de variável nullable
    // print(nomeOpcional.length);  
    
    // ✅ CORRETO - verificar antes de usar
    if (nomeOpcional != null) {
        print(nomeOpcional.length);
    }
    
    // ✅ CORRETO - non-nullable pode usar diretamente
    print(nomeObrigatorio.length); 
    }
   ```

4. Late Variables (Variáveis Tardias)
    O modificador late tem dois casos de uso: declarar uma variável non-nullable que é inicializada após sua declaração, e inicializar uma variável preguiçosamente Variables.
   
    ```dart
    late String description;

    void main() {
        description = 'Feijoada!';  // Inicializada depois
        print(description);          // Agora pode usar
    }
    ```

5. Wildcard Variables (`_`) - Versão Simples
    O que é "`_`"?
    É uma variável "não me importo" - você recebe um valor mas não vai usar.
    Casos Comuns:
    1. Em loops quando só quer repetir algo:
    ```dart
    // Quero fazer algo 3 vezes, não importa o número
    for (var _ in [1, 2, 3]) {
        print('Fazendo algo...');
    }
    // Resultado: imprime 3 vezes
    ```

    2. Em erros quando não quer detalhes:
    ```dart
    try {
        // código que pode dar erro
    } catch (_) {  // Pego qualquer erro, mas não uso os detalhes
        print('Deu erro, mas não importa qual');
    }
    ```

    3. Quando recebe valor mas não usa:
    ```dart
    void main() {
        var _ = calcularAlgo();  // Executa a função mas ignora o resultado
        print('Terminei!');
    }
    ```
    ***Resumo***: Use `_` quando você tem que receber um valor mas não vai usar ele.

### Quando posso usar `late`, `final` e `const`?
* Quando usar `final`: Quando você quer uma variável que nunca muda depois de receber o primeiro valor.
* Quando usar `const`: Para valores que nunca mudam e são conhecidos desde o início do programa.
* Quando usar `late`: Para valores que vão ser dado depois, É como dizer: "Eu prometo que vou dar um valor para essa variável depois, antes de usar!".

## Fontes em PT/EN:

* [Built-in types](https://dart.dev/language/built-in-types)
* [Variables](https://dart.dev/language/variables)
