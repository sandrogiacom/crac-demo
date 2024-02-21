# Demo CRaC

Demo para demonstrar como uma aplicação Spring Boot funciona com o mecanismo de Checkpoint e Restore (CRaC) disponibilizado em algumas distribuições do OpenJDK.

Requisitos:

- Java 21
- Docker ou similar

## Build application

Crie o jar da aplicação:

```bash
./mvnw clean package
```

## Build docker image

Crie a imagem docker:

```bash
docker build -t java21-crac .
```

## Run docker image

Iniciando o container para simular o comportamento do CRaC

```bash
docker run --privileged -p 8080:8080 --name demo_crac -it java21-crac
```

## Install JDK CRaC with SDKMAN

Dentro do container iniciado, vamos instalar o JDK compativel com CRaC

```bash
sdk install java 21.0.2.crac-zulu
```

## Start app inside container

Vamos iniciar a aplicação informando o diretório onde a JVM deverá gravar os arquivos do snapshot

```bash
java -XX:CRaCCheckpointTo=cr -jar demo.jar
```

### Enter container

Entrar no container em outro terminal

```bash
docker exec -it demo_crac /bin/bash
```

### Take a checkpoint

Captturar um snapshot da aplicação em execução

```bash
jcmd demo.jar JDK.checkpoint
```

### Start app from checkpoint

No mesmo terminal onde a aplicação estava sendo executada, execute o comando abaixo:

```bash
java -XX:CRaCRestoreFrom=cr
```
