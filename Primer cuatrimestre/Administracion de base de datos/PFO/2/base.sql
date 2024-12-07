CREATE TABLE Provincias (
  Codigo INT NOT NULL,
  Nombre VARCHAR(20) NOT NULL,
  CONSTRAINT PK_Provincias_Codigo  PRIMARY KEY (Codigo)
);

CREATE TABLE Clientes (
  Codigo INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(30) NOT NULL,
  Domicilio VARCHAR(30) NULL,
 Ciudad VARCHAR(20) NULL,
 CodigoProvincia INT NOT NULL,
 CONSTRAINT PK_Clientes_Codigo PRIMARY KEY (Codigo),
 CONSTRAINT FK_CodigoProvincia FOREIGN KEY(CodigoProvincia) REFERENCES Provincias(Codigo)
);

INSERT INTO Provincias VALUES (1,"Cordoba");
INSERT INTO Provincias VALUES (2,"Buenos Aires");
INSERT INTO Provincias VALUES (3,"Mendoza");
INSERT INTO Provincias VALUES (4,"Rio Negro");

INSERT INTO Clientes VALUES (NULL,"Perez Juan","San Martin 123", "Carlos Paz",1);
INSERT INTO Clientes VALUES (NULL,"Moreno Marcos","Colon 234 ", "Rosario",2);
INSERT INTO Clientes VALUES (NULL,"Solari Ana","Belgrano 567 ", "Mendoza ",3);
SELECT * FROM Clientes;
DELETE FROM Clientes WHERE Ciudad="Mendoza";