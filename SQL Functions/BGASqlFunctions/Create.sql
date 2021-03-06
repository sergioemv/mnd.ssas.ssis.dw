USE [MENDO_DW]
GO
/****** Object:  SqlAssembly [bga]    Script Date: 04/22/2008 17:51:01 ******/
drop function dbo.date
drop function dbo.capitalize
drop function dbo.NamePart
drop function dbo.ParseNumber 

IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = N'Mendo')
DROP ASSEMBLY [Mendo]

CREATE ASSEMBLY [Mendo]
AUTHORIZATION [dbo]
FROM 'E:\MENDOCINA\Version 1.0\SQL Functions\BGASqlFunctions\bin\Release\MendoSqlFunctions.dll'
WITH PERMISSION_SET = SAFE



GO
CREATE Function Date(@anio int, @mes int, @dia int)
RETURNS DATETIME EXTERNAL NAME Mendo.DateFunctions.Date


GO
CREATE Function Capitalize(@Cadena NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
EXTERNAL NAME Mendo.StringFunctions.Capitalize


GO
CREATE Function NamePart(@Cadena NVARCHAR(MAX), @Part int)
RETURNS NVARCHAR(MAX)
EXTERNAL NAME Mendo.StringFunctions.NamePart

GO
CREATE Function ParseNumber(@Cadena NVARCHAR(MAX))
RETURNS FLOAT
EXTERNAL NAME Mendo.NumericFunctions.ParseNumber