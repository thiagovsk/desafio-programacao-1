# README

## Rodar a aplicação

- Para rodar a aplicação basta ter o docker-compose instalado no computador e rodar o comando 

```
docker-compose up -d
./scripts/drails db:create db:migrate
```

E acessar o localhost:3000

## Para o teste

- Utilizei rspec + factory girl para testes
- Utilizei docker para construir os ambietes
- rubocop para métricas de código
- Ci em: https://travis-ci.org/thiagovsk/desafio-programacao-1

