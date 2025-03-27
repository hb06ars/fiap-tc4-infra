# TECH CHALLENGE 4 - PROJETO INFRA

### DESCRIÇÃO
> Intuito deste microserviço é apenas subir o Banco de dados e a 
> <br> criação das tabelas de uma única vez pelo docker-compose.

### EXECUÇÃO
> - Suba o Docker Desktop (caso seja o Windows).
> - Execute o arquivo: 
> - **docker-compose.yaml**
> - Subir os microserviços abaixo.

### MICROSERVIÇOS PARA SUBIR
> - Subir o docker compose do INFRA.
> - fiap-tc4-pedido-receiver
> - fiap-tc4-cliente
> - fiap-tc4-estoque
> - fiap-tc4-pagamento
> - fiap-tc4-pedido
> - fiap-tc4-produto

### TESTAR APLICAÇÃO
> - Abra o arquivo **Tech Challenge 4.postman_collection.json**
> - Fica na pasta **collections**.
> - Execute a collection: **Receiver - Fazer Pedido**
> - Há duas requisições que fazem o teste **COM SALDO** no cartão e **SEM SALDO** no cartão 
 
### ARQUITETURA
> - Linguagem: **Java 17**
> - Framework: **Spring Boot**

### CONEXAO LOCAL BANCO DE DADOS
> - url: **jdbc:postgresql://localhost:5432/gerenciamentodb**
> - usuário: **gerenciamento_user**
> - senha: **gerenciamento_pass**
> - bd: **gerenciamentodb**

### KAFKA
> - Link url KafkaDrop: **http://localhost:9000/**

### COLLECTIONS
> Abra a pasta collections para poder testar no postman.
