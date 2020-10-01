# AMAZING GORAILS

Esse é o código fonte do site [GORAILS](http://www.gorails.com.br/).
GORAILS tem como objetivo desenvolver um portal aonde todos os desenvolvedores de goiás e do brasil também possam se unir para beneficar a comunidade rails.


## Configuração Inicial

Esse projeto está sendo desenvolvido usando Ruby 2.4.2. Se você estiver utilizando [rvm](http://rvm.beginrescueend.com/)
ou [rbenv](https://github.com/sstephenson/rbenv) ele vai selecionar a versão exata em desenvolvimento
especificada no arquivo [.ruby-version](https://github.com/RubyCastsBrasil/RubyCastsBrasil/blob/master/.ruby-version).

- Se você quiser configurar o Ruby on Rails no Ubuntu, siga esse tutorial: http://gorails.com.br/blog/posts/show_list?id=1

- Faça o seu fork no projeto e clone ele para sua máquina


- Rode:
```shell
bundle install
```

- Crie um arquivo de configuração do banco de dados:
```shell
cp config/database.example.yml config/database.yml
```

- Crie um arquivo de configuração da aplicação:
```shell
cp config/application.example.yml config/application.yml
```


- Execute o comando `rake db:create` para cria seu banco de dados.
- Execute o comando `rake db:migrate` para criar todas as tabelas no seu banco de dados.
- Execute o comando `rake dev:setup` para popular o banco de dados com os dados basicos.
- Execute o comando `rails s` para subir o servidor [rails](https://github.com/rails/rails)

## Cloudinary
- Acessar o site: https://cloudinary.com/ e criar uma conta (Sign up for Free). Esse é um serviço de upload de imagens.
- Substitua as chaves do arquivo application.yml pelos dados fornecidos pela cloudinary:
```text
application.yml => Cloudnary Dashboard
CLOUD_NAME => Cloud name
API_KEY_CLOUD => Api key
API_SECRET_CLOUD => Api Secret
``` 


## Testes [![Build Status](https://travis-ci.org/gorails/gorails.svg?branch=master)](https://travis-ci.org/gorails/gorails)  [![Coverage Status](https://coveralls.io/repos/github/gorails/gorails/badge.svg?branch=master)](https://coveralls.io/github/gorails/gorails?branch=master) [![Open Source Helpers](https://www.codetriage.com/gorails/gorails/badges/users.svg)](https://www.codetriage.com/gorails/gorails)
 
## Dependências [![Dependency Status](https://gemnasium.com/gorails/gorails.svg)](https://gemnasium.com/gorails/gorails)

Esse projeto utiliza o [bundler](http://bundler.io) para controle de dependências `ruby`.
Projeto também monitorado pelo [gemnasium](https://gemnasium.com).

## Engines
Engines basicamente sao partes de uma aplicacao rails que esta em outro container, desenvolvemos esta parte de
codigo e encapsulamos ela como gema, assim podemos utilizar um codigo em varios lugares e tendo somente uma base de codigo para dar 
manutencao e evoluir. Nossa intencao contruindo as funcionalidades da gorails como engines, e de que todos
alem de se beneficiar com a gorails e oque ela traz para nos de beneficios possa utilizar o codigo gerado aqui na forma de 
contribuicao em seus projetos pessoais ou profissionais de uma forma facil. Resumindo voce ajuda a comunidade e se ajuda ao mesmo tempo!

Engines podem ser de dois tipos Full ou Mountable a diferenca e que --mountable cria uma engine com um namespace isolado
 e a opcao --full cria uma engine que compartilha do mesmo namespace da aplicacao principal. Na gorails normalmente optamos por
 construir uma engine --full e as vezes vemos a necessidade de colocar nos mesmos o namespace, porque precisamos diferencia tabelas
 que podem vir a se repetir em determinados lugares.
  
### Easy Static Pages

Engine de paginas semi estaticas, serve para cadastrar aquelas paginas staticas de sua aplicacao , mas voce pode editar o conteudo delas.
Para que seja mais facil quando voce necessitar de uma mudanca nao ter que editar no html.

Endereco da engine: [easy_static_pages](https://github.com/gorails/easy_static_pages)

### Go Blog

Engine de blogs, parte de gerencia e de listagem de blog posts, tambem inclui tags.

Endereco da engine : [go_blog](https://github.com/gorails/go_blog)

### Go Jobs

Engine para cadastrar e manter vagas de trabalho para a comunidade, todos os usuarios podem cadastrar vagas, 
os novos cadastros passam pela avaliacao dos moderadores para serem publicados.

Endereco da engine: [go_jobs](https://github.com/gorails/go_jobs)


### Go Gamification
Engine para implementar gamification no projeto, a intencao e que com a gamification os usuarios fiquem mais incentivados a produzir 
conteudo para a ferramenta ajudando a comunidade a ter um conteudo mais recente e de mais qualidade.
A engine implementa um sistema de recompensas com medalhas, sempre que o usuario atinge uma meta ele ganha 
uma medalha, e junto com a medalha ele ainda pode ganhar pontos de experiencia e tambem algumas unidades monetarias da comunidade.
Unidades monetarias que serao utilizadas na loja da comunidade. 

Endereco da engine: [go_gamification](https://github.com/gorails/go_gamification)

#### Como trabalhar com engines localmente 
Apos baixar e executar o projeto gorails, se voce quiser trabalhar com estas partes de codigo que estao separadas em engines
voce tambem precisa baixalas em sua maquina. Apos efetuar o fork de cada engine listada acima para que voce as tenha em seu repositorio pessoal.
Voce pode baixar todas para sua maquina do seu repositorio.

em sua estrutura de trabalho Projetos > gorails, crie outra pasta Projetos > engines e clone seus repositorios que voce efetuou o fork

    cd Projetos
    
    mkdir engines
    
    git clone https://github.com/SeuUsuario/easy_static_pages.git
    
    git clone https://github.com/SeuUsuario/go_blog.git
    
    git clone https://github.com/SeuUsuario/go_jobs.git
    
    git clone https://github.com/SeuUsuario/go_gamification.git
    

Apos baixar todas as engines para sua maquina voce agora pode ir ao Gemfile da gorails e apontar que as gemas das engines estao 
nas pastas que voce definiu como a seguir.

    gem 'easy_static_pages',path: '/home/SeuUsuario/Projetos/engines/go_blog'
    gem 'go_blog' ,path: '/home/SeuUsuario/Projetos/engines/go_blog'
    gem 'go_jobs',path: '/home/SeuUsuario/Projetos/engines/go_jobs'
    gem 'go_gamification',path: '/home/SeuUsuario/Projetos/engines/go_gamification'

Apos isto rode novamente os comandos bundle install, e bundle update.

Agora estas gemas estao rodando com o codigo local. Qualquer mudanca nos arquivos sera refletida na aplicacao principal.

### Go Tags

Engine de tags para uso no projeto ainda nao foi desenvolvida, esta integrada no codigo da go blog, atualizar esta secao depois.

### Go Attachments

Engine de attachments para uso no projeto, ainda nao foi desenvolvida, esta integrada no codigo da gorails.

## Controle da Qualidade 

## Garantia da Qualidade [![Code Climate](https://codeclimate.com/github/gorails/gorails/badges/gpa.svg)](https://codeclimate.com/github/gorails/gorails)

Para garantir a qualidade, é utilizado um guia de estilos, boas práticas e má praticas.
Essa garantia é monitorada pelo [Code Climate](https://codeclimate.com) e pelo [houndci](http://houndci.com).
O Code Climate checa por má práticas de programação em relação a estrutura do código enquanto 
que o Houndci checa má práticas na sintaxe do código, isto é, se a leitura do mesmo não é 
demasiada complicada.

## Documentação [![Inline docs](http://inch-ci.org/github/gorails/gorails.svg?branch=master)](http://inch-ci.org/github/gorails/gorails)
####Diagrama UML [PDF](https://github.com/gorails/gorails/blob/master/doc/uml_gorails.pdf) - Gerado em 11/05/2016 - 18:50
Para gerar um novo diagrama atualizado em sua maquina basta rodar o comando rake

```ruby
rake uml:generate
```

## Gerenciamento de Projeto [![Stories in Ready](https://badge.waffle.io/gorails/gorails.svg?label=ready&title=Ready)](http://waffle.io/gorails/gorails)

[![Throughput Graph](https://graphs.waffle.io/gorails/gorails/throughput.svg)](https://waffle.io/gorails/gorails/metrics)


## Discussões  

Para discussões relacionadas ao projeto, é utilizado o [Discord](https://discord.gg/mN5hXJm) que disponibiliza
um chat em tempo real.Instale o programa e clique no link para entrar no chat.

## Doações :moneybag:

Neste momento os responsáveis, por receber e prestar contas sobre as doações são @jcottobboni e @helioborges

#### Doações pelo PicPay

Procurar o usuário @helioborges, e efetue a Doação.



#### Doações pelo Mercado Pago 

[Doar  R$ 200,00](https://www.mercadopago.com/mlb/checkout/start?pref_id=192719033-cb23d353-2429-419f-8ca8-d0bae86ab334) /
[Doar  R$ 100,00](https://www.mercadopago.com/mlb/checkout/start?pref_id=192719033-6a1a0129-cee7-43d5-b2a9-7afa32e15abe) /
[Doar  R$ 50,00](https://www.mercadopago.com/mlb/checkout/start?pref_id=192719033-55dc62ab-7759-4483-9c10-b05bf4e59377) /
[Doar  R$ 20,00](https://www.mercadopago.com/mlb/checkout/start?pref_id=192719033-4a653d99-2493-4d75-8a42-7a2224ad703b) /
[Doar  R$ 10,00](https://www.mercadopago.com/mlb/checkout/start?pref_id=192719033-5dd6ed08-5c8b-4f47-8cd4-df0c573870f1) 
