CREATE VIEW documentosPersona AS SELECT Documento.`abreviatura`, Persona.`nombres`,Persona.`apellidos` FROM Persona INNER JOIN Documento ON Documento.`idPersona` = Persona.`idPersona`
