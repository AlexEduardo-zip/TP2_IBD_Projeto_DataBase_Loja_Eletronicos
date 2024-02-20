# Relatório - Projeto de Banco de Dados para Loja de Componentes Eletrônicos

**Integrantes:**
- Alex Eduardo Alves dos Santos
- Bernardo Souza Scaldaferri
- Bruno Silva Marques
- Renato Junio Costa Correia
- Pedro Henrique de Oliveira Barbosa

## 1. Apresentação

O trabalho consiste no projeto e implementação de um banco de dados relacional para uma loja de componentes eletrônicos. Inicialmente, realizamos o projeto conceitual por meio de um diagrama ER (Entidade Relacionamento). Posteriormente, na fase do projeto lógico, mapeamos esse diagrama para um esquema relacional que descreve a estrutura das tabelas e as restrições de integridade. O banco foi criado e populado com dados fictícios para avaliação do desempenho de diferentes consultas SQL.

## 2. Diagrama ER (Entidade Relacionamento)

O sistema da loja de componentes eletrônicos envolve entidades como Cliente, Transportadora, Operador, Fornecedor, Categoria e Componente. O relacionamento entre essas entidades é representado no diagrama ER, proporcionando uma visão precisa do banco de dados.

**Imagem 1:** Diagrama ER do banco de dados de uma loja de componentes eletrônicos.

## 3. Projeto Lógico

Com base no diagrama ER, desenvolvemos o projeto lógico que inclui todas as tabelas do banco de dados, suas relações e restrições de integridade. Também criamos o diagrama UML das tabelas para uma visualização gráfica das relações.

**Entidades:**
- Cliente
- Transportadora
- Operador
- Fornecedor
- Categoria
- Componente

**Relacionamentos:**
- Fornece
- Envia
- Entrega
- Compra

## 4. Consultas SQL (Queries)

Após o desenvolvimento do projeto lógico, implementamos o banco de dados e realizamos consultas SQL para testar o desempenho. Algumas consultas realizadas incluem:

1. Obter o nome de todos os clientes do estado de SP.
    ```sql
    SELECT nome FROM cliente WHERE estado = 'SP'
    ```

2. Obter o turno de trabalho de todos os operadores da unidade X.
    ```sql
    SELECT turno_trabalho FROM Operador WHERE unidade_operacao = 'X'
    ```

3. Obter os nomes dos componentes oferecidos por fornecedores de Belo Horizonte.
    ```sql
    SELECT nome
    FROM Fornecedor INNER JOIN Componente
    ON Fornecedor.cnpj = Componente.Fornecedor_cnpj
    WHERE cidade = 'Belo Horizonte'
    ```

4. Obter os clientes do estado de Santa Catarina atendidos pela transportadora X.
    ```sql
    SELECT nome, cpf
    FROM Cliente, Transportadora
    WHERE Cliente.Transportadora_cnpj = Transportadora.cnpj
    AND Cliente.estado = 'Santa Catarina'
    AND Transportadora.cnpj = 'X'
    ```

5. Obter o extrato dos componentes requisitados por clientes da Paraíba.
    ```sql
    SELECT idComponente, marca, nome, Fornecedor_cnpj
    FROM Cliente, Componente, Cliente_Componente
    WHERE Cliente.cpf = Cliente_Componente.Cliente_cpf
    AND Componente.idComponente = Cliente_Componente.Componente_idComponente
    AND Cliente.estado = 'Paraíba'
    ```

## 5. Auto Avaliação

**Renato:** Colaborou na elaboração da proposta, no diagrama ER, na formulação de consultas SQL e na construção do relatório.

**Bruno:** Contribuiu na elaboração do diagrama ER, na geração de dados para testes e em auxílios organizacionais.

**Bernardo:** Responsável por traduzir o esquema ER para o projeto lógico e participou da formulação de consultas.

**Pedro:** Construiu o diagrama UML, estruturou o banco de dados usando MySQL Workbench, colaborou na correção de erros durante a fase de popular o BD e ajudou na construção de consultas.

**Alex:** Colaborou na elaboração da proposta, nas consultas SQL, na popularização do banco de dados e nos testes. Resumiu e apresentou o trabalho no relatório e participou da elaboração da apresentação.

**Vídeo de Apresentação do Trabalho:** [Assista ao Vídeo](https://youtu.be/tqGUGlGFQl0)
