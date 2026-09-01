# **Nomenclatura**

Este documento descreve as nomenclatura usadas para schemas, tabelas, views, colunas e outros objetos no data warehouse.

## **Índice**

1. [Princípios Gerais](#general-principles)
2. [Convenções de Nomenclatura de Tabelas](#table-naming-conventions)
   - [Regras da Camada Bronze](#bronze-rules)
   - [Regras da Camada Silver](#silver-rules)
   - [Regras da Camada Gold](#gold-rules)
3. [Convenções de Nomenclatura de Colunas](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Colunas Técnicas](#technical-columns)
4. [Stored Procedures](#stored-procedure-naming-conventions)
---

## **Princípios Gerais**

- **Convenções de Nomenclatura**: Use `snake_case`, com letras minúsculas e sublinhados (`_`) para separar as palavras.
- **Idioma**: Use inglês para todos os nomes.
- **Evite Palavras Reservadas**: Não use palavras reservadas do SQL como nomes de objetos.

## **Convenções de Nomenclatura de Tabelas**

### **Regras da Camada Bronze**
- Todos os nomes devem começar com o nome do sistema de origem, e os nomes das tabelas devem corresponder aos seus nomes originais sem renomeação.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Nome do sistema de origem (ex: `crm`, `erp`).  
  - `<entity>`: Nome exato da tabela do sistema de origem.  
  - Exemplo: `crm_customer_info` → Informações de clientes do sistema CRM.

### **Regras da Camada Silver**
- Todos os nomes devem começar com o nome do sistema de origem, e os nomes das tabelas devem corresponder aos seus nomes originais sem renomeação.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Nome do sistema de origem (ex: `crm`, `erp`).  
  - `<entity>`: Nome exato da tabela do sistema de origem.  
  - Exemplo: `crm_customer_info` → Informações de clientes do sistema CRM.

### **Regras da Camada Gold**
- Todos os nomes devem usar nomes significativos e alinhados ao negócio para as tabelas, começando com o prefixo da categoria.
- **`<category>_<entity>`**  
  - `<category>`: Descreve o papel da tabela, como `dim` (dimensão) ou `fact` (tabela fato).  
  - `<entity>`: Nome descritivo da tabela, alinhado com o domínio de negócio (ex: `customers`, `products`, `sales`).  
  - Exemplos:
    - `dim_customers` → Tabela de dimensão para dados de clientes.  
    - `fact_sales` → Tabela fato contendo transações de vendas.  

#### **Glossário de Padrões de Categoria**

| Padrão      | Significado                       | Exemplo(s)                              |
|-------------|-----------------------------------|-----------------------------------------|
| `dim_`      | Tabela de dimensão                | `dim_customer`, `dim_product`           |
| `fact_`     | Tabela fato                       | `fact_sales`                            |
| `report_`   | Tabela de relatório               | `report_customers`, `report_sales_monthly`   |

## **Convenções de Nomenclatura de Colunas**

### **Surrogate Keys**  
- Todas as chaves primárias (primary keys) nas tabelas de dimensão devem usar o sufixo `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refere-se ao nome da tabela ou entidade à qual a chave pertence.  
  - `_key`: Um sufixo indicando que esta coluna é uma surrogate key.  
  - Exemplo: `customer_key` → Surrogate key na tabela `dim_customers`.
  
### **Colunas Técnicas**
- Todas as colunas técnicas devem começar com o prefixo `dwh_`, seguido por um nome descritivo indicando o propósito da coluna.
- **`dwh_<column_name>`**  
  - `dwh`: Prefixo exclusivamente para metadados gerados pelo sistema.  
  - `<column_name>`: Nome descritivo indicando o propósito da coluna.  
  - Exemplo: `dwh_load_date` → Coluna gerada pelo sistema usada para armazenar a data em que o registro foi carregado.
 
## **Stored Procedures**

- Todas as stored procedures usadas para carregar dados devem seguir o padrão de nomenclatura:
- **`load_<layer>`**.
  
  - `<layer>`: Representa a camada sendo carregada, como `bronze`, `silver` ou `gold`.
  - Exemplo: 
    - `load_bronze` → Stored procedure para carregar dados na camada Bronze.
    - `load_silver` → Stored procedure para carregar dados na camada Silver.
