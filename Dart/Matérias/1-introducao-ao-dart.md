📜Roadmap 👉[ https://roadmap.sh/r/full-dart-rotation](https://)

## História do Dart
Dart é uma linguagem de programação desenvolvida pelo Google, inicialmente ele era conhecido como Dash por volta do ano de 2011, e foi nesse mesmo ano que a linguagem começou a existir.

Inicialmente, o Dart foi desenvolvido para substituir o JS dos navegadores, e foi no ano de 2013 que foi lançada a primeira versão estável da mesma linguagem.

E hoje o Dart é uma linguagem multi paradigma, usada para o desenvolvimento de aplicações web, mobile e desktop. Essa linguagem permite que o código criado rode tanto no lado do cliente e do servidor. E a mesma é uma linguagem de código aberto.

## Configurando o ambiente Dart
### No Windows (Usando gerenciador de de pacote - Chocolatey)
1. Instale o Chocolatey.
2. Inicie o PowerShell com permissões elevadas.
```
C:\> choco install dart-sdk
```

#### Alterar caminho de instalação padrão
Por padrão, o Chocolatey instala o SDK em C:\tools\dart-sdk. Para alterar esse local, defina a ChocolateyToolsLocationvariável de ambiente como o diretório de instalação desejado.

#### Verifique se seu PATH inclui Dart
Verifique se você consegue executar o Dart.
```
C:\> dart --version
Dart SDK version: 3.2.4 (stable) (Thu Dec 21 19:13:53 2023 +0000) on "win_x64"
```
Se sua máquina de desenvolvimento não retornar uma versão do Dart, adicione o local do SDK ao seu PATH:

1. Na caixa de pesquisa do Windows, digite env.
2. Clique em Editar as variáveis de ambiente do sistema .
3. Clique em Variáveis de ambiente... .
4. Na seção de variável de usuário, selecione Caminho e clique em Editar... .
5. Clique em Novo e insira o caminho para o dart-sdkdiretório.
6. Em cada janela que você acabou de abrir, clique em Aplicar ou OK para descartá-la e aplicar a alteração do caminho.

#### Atualize usando Chocolatey
Para atualizar o Dart SDK, use o seguinte comando.
```
C:\> choco upgrade dart-sdk
```

#### Desinstalar usando Chocolatey
Para desinstalar o Dart SDK, execute as seguintes etapas.

1. Inicie o PowerShell com permissões elevadas.
2. Use o seguinte comando.
```
C:\> choco uninstall dart-sdk
```

3. Remova os arquivos de configuração do Dart do seu diretório inicial.
```
C:\> Remove-Item -Recurse -Force ^
     -Path $env:LOCALAPPDATA\.dartServer,$env:APPDATA\.dart,$env:APPDATA\.dart-tool
```

## SDK e ferramentas do Dart
O SDK do Dart contém as ferramentas necessárias para desenvolver aplicativos Dart, incluindo compiladores, analisadores de código, formatadores e ferramentas de gerenciamento de pacotes.

Um **SDK**, ou Kit de Desenvolvimento de Software, é um conjunto de ferramentas, bibliotecas e documentação que auxiliam os desenvolvedores na criação de aplicativos para uma plataforma específica. Ele fornece um ambiente de desenvolvimento integrado, facilitando a criação, teste e implementação de software, economizando tempo e esforço. 

Principais ferramentas incluídas no Dart SDK:

* **Dart VM:** A máquina virtual que executa o código Dart.
* **dart2js**: Transpilador Dart para JavaScript, usado para desenvolvimento web.
* **dartfmt**: Formatador de código Dart, garante um estilo de código consistente.
* **dartanalyzer**: Ferramenta de análise estática que detecta erros e avisos no código Dart.
* **dartdoc**: Gerador de documentação API para Dart.
* **pub**: Gerenciador de pacotes Dart, usado para adicionar dependências ao projeto.
* **dart**: Interface de linha de comando para criar, formatar, analisar, testar, gerar documentação, compilar e executar código Dart, além de gerenciar pacotes com o pub

## Sintaxe básica do Dart
```dart
void main() {
  print('Olá, Dart!');
}
```

## Fontes em PT/EN:

* [Dart overview](https://dart.dev/overview)
* [Wikipedia PT](https://pt.wikipedia.org/wiki/Dart_(linguagem_de_programa%C3%A7%C3%A3o))
* [Hostinger](https://www.hostinger.com/br/tutoriais/linguagem-dart)
