USE GlubApp

CREATE TABLE Aircrafts(
	id int IDENTITY NOT NULL,
	plate varchar(6) NOT NULL UNIQUE,
	aircraftType bit NOT NULL,
	isFlying bit NOT NULL
)
GO

CREATE PROCEDURE NewAircraft
	 @plate varchar(6), 
	 @airType bit,
	 @isFlying bit
AS
	Insert into Aircrafts(plate, aircraftType, isFlying) Values(@plate, @airType, @isFlying)
Go

CREATE PROCEDURE getAircraft
AS
	SELECT plate , aircraftType , id FROM Aircrafts
GO

CREATE PROCEDURE getAircraftFromPlate
	@plate varchar(6)
AS
	SELECT plate , aircraftType , id FROM Aircrafts WHERE (plate = @plate)
GO

CREATE PROCEDURE ModifAircraft
	@Id int,
	@plate varchar(6), 
	@airType bit
AS
	UPDATE Aircrafts SET plate = @plate,
	aircraftType= @airType
	where (id = @Id)
Go					

Create PROCEDURE ChangeFlyingState
	@plate varchar(6)
AS
	Declare @isFlying bit = (SELECT isFlying FROM Aircrafts WHERE (plate= @plate))
	IF (@isFlying = 0)
		UPDATE Aircrafts SET isFlying = 1
	ELSE
		UPDATE Aircrafts SET isFlying = 0	
GO

CREATE PROCEDURE DeleteAircraft
	@plate varchar(6)
AS
	DELETE FROM Aircrafts where (plate = @plate)
GO

CREATE PROCEDURE getAircraftFlying
AS
    SELECT plate, aircraftType, id FROM Aircrafts WHERE (isFlying=0)
GO	
	
												