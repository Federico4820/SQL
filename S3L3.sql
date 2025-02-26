USE Northwind

SELECT COUNT(*) AS TotaleOrdini
FROM Orders;

SELECT COUNT(*) AS TotaleClienti
FROM Customers;

SELECT COUNT(*) AS ClientiLondra
FROM Customers
WHERE City = 'London';

SELECT AVG(Freight) AS MediaCostoTrasporto
FROM Orders;

SELECT AVG(Freight) AS MediaCostoTrasporto_BOTTM
FROM Orders
WHERE CustomerID = 'BOTTM';

SELECT CustomerID, SUM(Freight) AS TotaleSpeseTrasporto
FROM Orders
GROUP BY CustomerID;

SELECT City, COUNT(*) AS NumeroClienti
FROM Customers
GROUP BY City;

SELECT OrderID, SUM(UnitPrice * Quantity) AS TotaleProdotto
FROM [Order Details]
GROUP BY OrderID;

SELECT SUM(UnitPrice * Quantity) AS TotaleOrdine10248
FROM [Order Details]
WHERE OrderID = 10248;

SELECT CategoryID, COUNT(*) AS NumeroProdotti
FROM Products
GROUP BY CategoryID;

SELECT ShipCountry, COUNT(*) AS NumeroOrdini
FROM Orders
GROUP BY ShipCountry;

SELECT ShipCountry, AVG(Freight) AS MediaCostoTrasporto
FROM Orders
GROUP BY ShipCountry;
