/*
===================================
Create Database and  Schemas
===================================

Script purpose:
  This scripts create database and before creating the database it checks if it already exists or not.
  if the database already exists then it first drop the database and recreate it. Additionally it sets up
  three schemas within the database : 'bronze', 'silver', 'gold'

WARNING:
  Running this script will drop the entire 'DataWarehouse' Database if it exists.
  All the data in the database will be permanently deleted. Proceed with caution 
  and ensure you have proper backups before running this scripts.
*/

-- create database 'DataWarehouse'

use master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--create the 'DataWarehouse' database

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- create schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO 
CREATE SCHEMA gold;
GO
