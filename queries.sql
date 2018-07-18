-- Q1: Query all of the entries in the Genre table
SELECT *
FROM Genre

-- Q2: Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
VALUES
(null, "Beyonce", 1996);

-- Q3: Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
VALUES
(null, "Lemonade", 2016, 400, "Roc Nation", 28, 6),
(null, "I am Sasha Fierce", 2010, 400, "Roc Nation", 28, 6)

-- Q4: Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
VALUES
(null, "Sorry", 120, "09/16/2016", 6, 28, 23),
(null, "Hold Up", 400, "09/16/2016", 6, 28, 23)

-- Q5: Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT 
	Artist.ArtistName,
	Album.Title,
	Song.Title
FROM Artist
LEFT JOIN Album ON Album.ArtistId = Artist.ArtistId
LEFT JOIN Song ON Song.AlbumId = Album.AlbumId
WHERE 
	Album.Title = "Lemonade"
AND
	Artist.ArtistName = "Beyonce"

-- Q6: Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
	Album.Title,
	count(Song.SongId) as "Song Count"
FROM
	Song
LEFT JOIN Album ON Album.AlbumId = Song.AlbumId
GROUP BY
	Album.Title

-- Q7: Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
	Artist.ArtistName,
	count(Song.SongId) as "Song Count"
FROM
	Song
JOIN Artist ON Artist.ArtistId = Song.ArtistId
GROUP BY
	Artist.ArtistName

-- Q8: Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
	Genre.Label,
	count(Song.SongId) as "Song Count"
FROM
	Song
JOIN Genre ON Genre.GenreId = Song.GenreId
GROUP BY
	Genre.Label

-- Q9: Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT
	Album.Title as "Album Title",
	Song.Title as "Song Title",
	max(Song.SongLength) as "Duration"
FROM
	Song
JOIN Album ON Album.AlbumId = Song.AlbumId
-- Q10: Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

-- Q11: Modify the previous query to also display the title of the album.