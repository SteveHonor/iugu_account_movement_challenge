# Iugu | Desafio de Movimentação de Contas

## Desafio

<https://github.com/iugu/account_movement_challenge>

## Gems

- sqlite3 - banco de dados
- activerecord - orm, abstrair db
- pry - debuggar a aplicação

## Git

padrão de mensagens: <http://karma-runner.github.io/4.0/dev/git-commit-msg.html>

exemplo:

```bash
<type>(<scope>): <subject>
```

## Requisitos Opcionais

- Docker (recomendado: version 19.03.8)
- Docker-compose (recomendo: version 1.25.4)

## Setup

1. `docker-compose build`
2. `docker-compose run web rake db:migrate`

--------------------------------------------------------------------------------

## Run

```
docker-compose run web bundle exec ruby main.rb contas.csv transacoes.csv
```
