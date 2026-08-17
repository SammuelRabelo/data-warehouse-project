/*
================================
Criar banco de dados e schemas
================================

Proposta do Script:
	Este script cria um novo banco de dados com nome de `DataWareHouse` depois de checar se ele já existe.
	Se o banco de dados já existir ele exclui e recria. O Script também cria 3 schemas dentro do banco de dados: `bronze`, `silver`, `gold`.

Atenção:
	Ao rodar esse script ele vai excluir o banco de dados `DataWareHouse` por completo se ele já existir.
	Todos os dados no banco serão permanentemente excluídos. Prossiga com atenção e tendo certeza que você backups antes de rodar o script.
*/


USE master;
GO

-- Excluir e recriar banco de dados `DataWareHouse`
IF EXISTS (SELECT 1 FROM sys.database WHERE name = `DataWareHouse`)
BEGIN
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO

-- Criar banco de dados DataWareHouse
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO


-- Criar Schemas
CREATE SCHEMA bronze; 
GO

CREATE SCHEMA silver; 
GO

CREATE SCHEMA gold; 
GO
