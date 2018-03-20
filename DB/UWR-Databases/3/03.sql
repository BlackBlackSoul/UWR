DROP TABLE IF EXISTS Buffer;
GO

DROP TABLE IF EXISTS History;
GO

DROP TABLE IF EXISTS Parameters;
GO

CREATE TABLE Buffer (
	ID INT IDENTITY PRIMARY KEY,
	url_address VARCHAR(256) NOT NULL,
	last_visit DATE NOT NULL
);
GO

CREATE TABLE History (
	ID INT IDENTITY PRIMARY KEY,
	url_address VARCHAR(256) NOT NULL,
	last_visit DATETIME2 NOT NULL
);
GO

CREATE TABLE Parameters(
	name_param VARCHAR(256) NOT NULL,
	value_param INT NOT NULL
);
GO

INSERT INTO Parameters VALUES
	('max_cache', 3);
GO

INSERT INTO Buffer (url_address, last_visit) VALUES
	('google.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2)),
	('facebook.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
GO


IF OBJECT_ID ('insert_page', 'TR') IS NOT NULL
   DROP TRIGGER insert_page;
GO

CREATE TRIGGER insert_page
ON Buffer
INSTEAD OF INSERT
AS BEGIN
	IF (EXISTS (SELECT * FROM Buffer
			WHERE url_address = (SELECT url_address FROM inserted)))
		UPDATE Buffer
			SET last_visit=(SELECT last_visit FROM inserted)
			WHERE url_address = (SELECT url_address FROM inserted);
	ELSE
	BEGIN
		IF ((SELECT COUNT(*) FROM Buffer) <
				(SELECT value_param FROM Parameters WHERE name_param='max_cache'))
			INSERT INTO Buffer (url_address, last_visit)
				SELECT url_address, last_visit FROM inserted;
		ELSE
		BEGIN
			DECLARE @least_recently_visited TABLE(
				ID INT, url_address VARCHAR(256), last_visit DATETIME);
			INSERT INTO @least_recently_visited
				SELECT TOP 1 * FROM Buffer ORDER BY last_visit ASC;

			IF (EXISTS (SELECT * FROM History
					WHERE url_address = (SELECT url_address FROM @least_recently_visited)))
				UPDATE History
					SET last_visit=(SELECT last_visit FROM @least_recently_visited)
					WHERE url_address = (SELECT url_address FROM @least_recently_visited);
			ELSE
				INSERT INTO History (url_address, last_visit)
					SELECT url_address, last_visit FROM @least_recently_visited;

			DELETE FROM Buffer WHERE ID =
				(SELECT ID FROM @least_recently_visited);
			INSERT INTO Buffer (url_address, last_visit)
				SELECT url_address, last_visit FROM inserted;
		END
	END
END
GO

INSERT INTO Buffer (url_address, last_visit) VALUES ('google.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('facebook.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('ii.uni.wroc.pl', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('google.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('facebook.com', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('ii.uni.wroc.pl', CAST('1968-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('google.com', CAST('1969-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('facebook.com', CAST('1970-10-23 12:45:37.123' AS DATETIME2));
INSERT INTO Buffer (url_address, last_visit) VALUES ('ii.uni.wroc.pl', CAST('1971-10-23 12:45:37.123' AS DATETIME2));
GO

SELECT * FROM Buffer;
GO	