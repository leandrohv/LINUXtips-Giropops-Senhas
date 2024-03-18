# LINUXtips-Giropops-Senhas
Desafio PICK 2024 - LINUXtips Giropops Senhas

**Lista de atividades para esse desafio!**

- [x] Criar um conta no Docker Hub, caso ainda não possua uma.
- [x] Criar uma conta no Github, caso ainda não possua uma.
- [x] Criar um Dockerfile para criar uma imagem de container para a nossa App
    - [x] O nome da imagem deve ser SEU_USUARIO_NO_DOCKER_HUB/linuxtips-giropops-senhas:1.0
- [x] Fazer o push da imagem para o Docker Hub, essa imagem deve ser pública
- [x] Criar um repo no Github chamado LINUXtips-Giropops-Senhas, esse repo deve ser público
- [x] Fazer o push do cógido da App e o Dockerfile
- [x] Criar um container utilizando a imagem criada
    - [x]  O nome do container deve ser giropops-senhas
    - [x]  Você precisa deixar o container rodando
- [x] O Redis precisa ser um container

Dica: Preste atenção no uso de variável de ambiente, precisamos ter a variável REDIS_HOST no container. Use sua criatividade!

## Como validar esse desafio

Execute os passos abaixo para validar o funcionamento do desafio

### Exporte uma variável de ambiente para armazenar seu usuário do Docker Hub
Exporte seu usuário no docker hub, observe que você deve informar seu usuário no Docker Hub após o sinal de igual(=).

```
export USER_DOCKER_HUB=SEU_USUARIO_NO_DOCKER_HUB
```

### Executar o login no Docker Hub
```
docker login -u $USER_DOCKER_HUB
```

### Crie uma network para o container da aplicação se comunicar com o redis:

```
docker network create -d bridge desafio
```

### Iniciar um container do Redis nessa rede:

```
docker run -d -p 6379:6379 --network desafio --name redis redis
```

### Exportando a variável de ambiente do redis
```
export REDIS_HOST=HOST_REDIS
```

### Gerar a imagem linuxtips-giropops-senhas:1.0
```
docker image build -t $USER_DOCKER_HUB/linuxtips-giropops-senhas:1.0 .
```

### Executar um container com a imagem SEU_USUARIO_NO_DOCKER_HUB/linuxtips-giropops-senhas:1.0

```
docker container run -d -p 5000:5000 --network desafio --env REDIS_HOST=$REDIS_HOST --name giropops-senhas $USER_DOCKER_HUB/linuxtips-giropops-senhas:1.0
```

### Fazer o push da imagem para o Docker Hub

```
docker push $USER_DOCKER_HUB/linuxtips-giropops-senhas:1.0
```
