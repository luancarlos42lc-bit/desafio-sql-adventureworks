# Desafio SQL: Analise de Retencao de Talentos - AdventureWorks

## Contexto do Desafio
A lideranca da area de Recursos Humanos solicitou um relatorio estrategico para identificar os 5 funcionarios mais antigos do departamento de Vendas (Sales). O objetivo e mapear profissionais experientes posicionados nos niveis organizacionais 2, 3 e 4 para subsidiar um plano interno de retencao de talentos e mentoria.

## Solucao Tecnica Implementada
Para extrair as informacoes com maxima performance e sem redundancias, foi construida uma consulta SQL estruturada com as seguintes premissas:
* Filtragem de escopo utilizando o operador LIKE para restringir os cargos de vendas e BETWEEN para delimitar o nivel organizacional exigido.
* Consolidacao de dados por meio de juncoes eficientes (INNER JOIN) entre as tabelas Person.Person, HumanResources.Employee e Person.EmailAddress utilizando chaves primarias e estrangeiras (BusinessEntityID).
* Otimizacao da entrega retornando apenas as colunas estritamente necessarias solicitadas pelo negocio, limitando o resultado aos 5 primeiros registros atraves do comando TOP 5 alinhado a ordenacao cronologica (ORDER BY ASC).

## Codigo SQL
```sql
SELECT TOP 5
    P.BusinessEntityID,
    P.FirstName,
    P.LastName,
    RH.JobTitle,
    EA.EmailAddress,
    RH.HireDate
FROM PERSON.Person AS P
INNER JOIN PERSON.EmailAddress AS EA
    ON P.BusinessEntityID = EA.BusinessEntityID
INNER JOIN HumanResources.Employee AS RH
    ON P.BusinessEntityID = RH.BusinessEntityID
WHERE RH.JobTitle LIKE '%SALES%' 
  AND RH.OrganizationLevel BETWEEN 2 AND 4
ORDER BY RH.HireDate ASC; 
```
