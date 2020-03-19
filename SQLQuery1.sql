--1. Query all of the entries in the Genre table
SELECT
    Id,
    Label
FROM Genre;

--2.Using the INSERT statement, add one of your favorite artists to the Artist table.;
INSERT INTO Artist (ArtistName, YearEstablished) 
VALUES ('Frank Ocean', 2011);

--3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.;
INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) 
VALUES ('Blonde', '08/20/2016', 3608, 'Boys Dont Cry', 28, 13);

--4. Using the INSERT statement, add some songs that are on that album to the Song table.;
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Pink + White', 185, '08/20/2016', 13, 28, 24),
('Be Yourself', 87, '08/20/2016', 13, 28, 24),
('Solo', 257, '08/20/2016', 13, 28, 24),
('Skyline To', 185, '08/20/2016', 13, 28, 24),
('Self Control', 250, '08/20/2016', 13, 28, 24),
('Good Guy', 67, '08/20/2016', 13, 28, 24),
('Nights', 307, '08/20/2016', 13, 28, 24),
('Solo (Reprise)', 79, '08/20/2016', 13, 28, 24),
('Pretty Sweet', 159, '08/20/2016', 13, 28, 24),
('Facebook Story', 69, '08/20/2016', 13, 28, 24),
('Close To You', 86, '08/20/2016', 13, 28, 24),
('White Ferrari', 249, '08/20/2016', 13, 28, 24),
('Siegfried', 335, '08/20/2016', 13, 28, 24),
('Godspeed', 178, '08/20/2016', 13, 28, 24),
('Futura Free', 564, '08/20/2016', 13, 28, 24);

--5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

--ex. SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--ex. SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;
SELECT s.Title, al.Title, ar.ArtistName FROM Album al
LEFT JOIN Artist ar ON ar.Id = al.ArtistId
LEFT JOIN Song s ON s.ArtistId = al.ArtistId
WHERE al.Id = 24

--6. Write a SELECT statement to display how many songs exist for each album. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT	Count(albumId) as 'Song Count', a.Title
from Song s
LEFT JOIN Album a on s.AlbumId = a.Id
GROUP BY AlbumId, a.Title

--7. Write a SELECT statement to display how many songs exist for each artist. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT Count(artistId) as 'Song Count', a.ArtistName
from Song s
LEFT JOIN Artist a on s.ArtistId = a.Id
GROUP BY ArtistId, a.ArtistName

--8. Write a SELECT statement to display how many songs exist for each genre. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT Count(genreId) as 'Song Count', a.Label
from Song s
LEFT JOIN Genre a on s.GenreId = a.Id
GROUP BY GenreId, a.Label

--9. Using MAX() function, write a select statement to find the album with the longest duration. 
--The result should display the album title and the duration.
SELECT Title, AlbumLength as 'Album Length'
from Album
WHERE AlbumLength=(SELECT MAX(AlbumLength) from Album);

--10. Using MAX() function, write a select statement to find the song with the longest duration. 
--The result should display the song title and the duration.
SELECT Title, SongLength as 'Song Length'
from Song
WHERE SongLength=(SELECT MAX(SongLength) from Song)

--11. Modify the previous query to also display the title of the album.
SELECT s.Title, a.Title, SongLength as 'Song Length'
from Song s
LEFT JOIN Album a on s.AlbumId = a.Id
WHERE SongLength=(SELECT MAX(SongLength) from Song)