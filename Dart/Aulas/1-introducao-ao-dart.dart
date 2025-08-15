void main() {
  //========= Variáveis =========
  var nome = "João"; // para inferência automática de tipo.
  Object nomeCompleto = "João Da Silva"; // para aceitar qualquer tipo de valor.
  String sobreNome =
      "Da Silva"; // para garantir que só valores do tipo String sejam aceitos.

  print(
    "Olá, $nome!. Bem-vindo ao Dart! Seu nome completo é $nomeCompleto e seu sobrenome é $sobreNome.",
  );

  /*========= Curiosidade =========
  Não, tempo de compilação e tempo de execução são coisas diferentes:

  Tempo de compilação: É o momento em que o código fonte é analisado e convertido em código executável pelo compilador. Erros de sintaxe e de tipo geralmente aparecem aqui.

  Tempo de execução: É quando o programa já está rodando, após ter sido compilado. Erros que dependem do comportamento do programa (como acessar um método que não existe) aparecem aqui.
  */
}
