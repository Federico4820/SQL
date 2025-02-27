USE GestioneImpiegati

CREATE TABLE IMPIEGO (
    IDImpiego INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TipoImpiego VARCHAR(100) NOT NULL,
);

CREATE TABLE IMPIEGATO (
    IDImpiegato INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Cognome VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    CodiceFiscale VARCHAR(16) NOT NULL,
    DataNascita DATE NOT NULL,
    RedditoMensile DECIMAL(10,2) NOT NULL,
    DetrazioneFiscale BIT NOT NULL,
    DataMatrimonio DATE,   
    TipoImpiego INT NOT NULL, -- FK verso IMPIEGO
	DataAssunzione DATE NOT NULL
);

ALTER TABLE IMPIEGATO
ADD CONSTRAINT FK_Impiegato_Impiego
    FOREIGN KEY (TipoImpiego) 
    REFERENCES IMPIEGO (IDImpiego);

INSERT INTO IMPIEGO (TipoImpiego)
VALUES 
    ('Programmatore'),
    ('Analista'),
    ('Project Manager'),
    ('HR Specialist');

INSERT INTO IMPIEGATO (Cognome, Nome, CodiceFiscale, DataNascita, RedditoMensile, DetrazioneFiscale, DataAssunzione, TipoImpiego)
VALUES 
('Marini', 'Francesca', 'MRNFNC75A41F205X', '1975-10-12', 2200.00, 1, '2001-06-15', 1), 
('Gallo', 'Lorenzo', 'GLLLRN82B21F205X', '1982-02-21', 1800.00, 0, '2007-03-10', 2), 
('Lepore', 'Federico', 'LPRFRC03H18A509N', '2003-06-18', 3100.00, 1, '2022-09-03', 4), 
('Esposito', 'Antonio', 'SPSNTN85E12F205X', '1985-05-12', 2500.00, 1, '2012-05-03', 4), 
('Ricci', 'Giovanni', 'RCCGVN87F14F205X', '1987-06-14', 2000.00, 0, '2006-12-01', 1), 
('Bruni', 'Alessia', 'BRNLSA93G25F205X', '1993-07-25', 2800.00, 1, '2020-01-10', 2), 
('Ferrari', 'Marco', 'FRRMRC79H11F205X', '1979-08-11', 3400.00, 1, '2005-06-20', 3), 
('Villa', 'Beatrice', 'VLLBTR81L09F205X', '1981-12-09', 1500.00, 0, '2015-04-18', 4), 
('Greco', 'Leonardo', 'GRCLND76A05F205X', '1976-01-05', 2600.00, 1, '2000-07-17', 1), 
('Conti', 'Elena', 'CNTLNE92D18F205X', '1992-04-18', 3200.00, 0, '2016-03-25', 2), 
('Barbieri', 'Matteo', 'BRBMTT88E30F205X', '1988-05-30', 2950.00, 1, '2015-09-15', 3), 
('Testa', 'Luca', 'TSTLCU91H22F205X', '1991-08-22', 2100.00, 0, '2018-11-30', 4), 
('Pellegrini', 'Anna', 'PLLANN77B13F205X', '1977-02-13', 2750.00, 1, '2003-11-11', 1), 
('Vitale', 'Chiara', 'VTLCHR94C07F205X', '1994-03-07', 2400.00, 0, '2017-06-20', 2), 
('Mariani', 'Federico', 'MRNFDR86D20F205X', '1986-04-20', 3050.00, 1, '2008-10-25', 3);


SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    DataNascita,
    DATEDIFF(YEAR, DataNascita, GETDATE()) AS Eta
FROM IMPIEGATO
WHERE DATEDIFF(YEAR, DataNascita, GETDATE()) > 29;

SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    RedditoMensile
FROM IMPIEGATO
WHERE RedditoMensile >= 800.00;

SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    DetrazioneFiscale
FROM IMPIEGATO
WHERE DetrazioneFiscale = 1;

SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    DetrazioneFiscale
FROM IMPIEGATO
WHERE DetrazioneFiscale = 0;

SELECT 
    IDImpiegato,
    Cognome,
    Nome
FROM IMPIEGATO
WHERE Cognome LIKE 'G%'
ORDER BY Cognome ASC;

SELECT COUNT(*) AS TotaleImpiegati
FROM IMPIEGATO;

SELECT AVG(RedditoMensile) AS RedditoMedio
FROM IMPIEGATO;

SELECT SUM(RedditoMensile) AS TotaleRedditi
FROM IMPIEGATO;

SELECT MAX(RedditoMensile) AS RedditoMassimo
FROM IMPIEGATO;

SELECT MIN(RedditoMensile) AS RedditoMinimo
FROM IMPIEGATO;

SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    DataAssunzione
FROM IMPIEGATO
WHERE DataAssunzione BETWEEN '20070101' AND '20080101';

DECLARE @TipoImpiego NVARCHAR(50);
SET @TipoImpiego = 4;

SELECT 
    IDImpiegato,
    Cognome,
    Nome,
    TipoImpiego
FROM IMPIEGATO
WHERE TipoImpiego = @TipoImpiego;

SELECT 
    AVG(DATEDIFF(YEAR, DataNascita, GETDATE())) AS Et‡Media
FROM IMPIEGATO;

