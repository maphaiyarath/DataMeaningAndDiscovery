# Michelle Aphaiyarath
# Project 4 -> RDBMS

require 'sqlite3'

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SCHEMA = "SELECT songs.name, genres.name, artists.name, albums.name FROM songs, genres, artists, albums WHERE artists.id = albums.artist_id AND genres.id = songs.genre_id AND albums.id = songs.album_id;"
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ALBUMS = "SELECT name FROM albums;"
SQL_SELECT_ARTISTS = "SELECT name FROM artists;"
SQL_GENRES_TABLE = "SELECT * FROM genres;"
SQL_ALBUMS_TABLE = "SELECT * FROM albums;"
SQL_ARTISTS_TABLE = "SELECT * FROM artists;"

# correctly configures, connects & disconnects from DB
db = SQLite3::Database.new(DB_FILE_NAME)

# displays initial menu of 5 options to user
puts "Welcome to the music database!"
puts "	1. Display all song information."
puts "	2. Add a new genre."
puts "	3. Add a new album (to an existing artist)."
puts "	4. Add a new artist."
puts "	5. Add a new song."
print "Enter a choice: "
user_input = gets.chomp

case user_input
when '1'
	# lists all songs, albums, artists & genres
	# assuming each song entry is completely filled out, then it'll display all songs...
	puts "[song name] | [genre] | [artist] | [album]"
	puts "=========================================="
	db.execute(SQL_SCHEMA) do |row|
		puts row.join " | "
	end
when '2'
	# enables user to add new genre name
	puts "Genres in the database:"
	db.execute(SQL_SELECT_GENRES) do |row|
		puts row
	end
	print "New genre name: "
	new_genre = gets.chomp
	genres_table = "INSERT INTO genres (name) VALUES ('#{new_genre}');"
	db.execute(genres_table)
	puts "UPDATED!"
	puts "========"
	db.execute(SQL_SELECT_GENRES) do |row|
		puts row
	end
when '3'
	# enables user to add new album name
	puts "Albums in the database:"
	db.execute(SQL_SELECT_ALBUMS) do |row|
		puts row
	end
	print "New album name: "
	new_album = gets.chomp
	db.execute (SQL_ARTISTS_TABLE) do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	print "Select an artist's id: "
	album_artist = gets.chomp
	artist_id_col = "INSERT INTO albums (name, artist_id) VALUES ('#{new_album}', '#{album_artist}');"
	db.execute(artist_id_col)

when '4'
	# enables user to add new artist name
	puts "Artists in the database:"
	db.execute(SQL_SELECT_ARTISTS) do |row|
		puts row
	end
	print "New artist name: "
	new_artist = gets.chomp
	artists_table = "INSERT INTO artists (name) VALUES ('#{new_artist}');"
	db.execute(artists_table)
	puts "UPDATED!"
	puts "========"
	db.execute(SQL_SELECT_ARTISTS) do |row|
		puts row
	end
when '5'
	# enables user to add new song, per spec
	puts "Add a new song!"
	print "Song name: "
	new_song = gets.chomp
	puts "Genres:"
	db.execute (SQL_GENRES_TABLE) do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	print "Select a genre: "
	song_genre = gets.chomp
	puts "Albums:"
	db.execute (SQL_ALBUMS_TABLE) do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	print "Select an album: "
	song_album = gets.chomp

	#puts "Artists:"
	#db.execute (SQL_ARTISTS_TABLE) do |row|
	#	puts "#{row[0]}. #{row[1]}"
	#end
	#print "Select an artist: "
	#song_artist = gets.chomp

	song_entry = "INSERT INTO songs (name, genre_id, album_id) VALUES ('#{new_song}', '#{song_genre}', '#{song_album}');"
	db.execute(song_entry)
else
	puts "Please choose an option from 1. to 5., thanks!"
	print "Enter a choice... again: "
	user_input = gets.chomp
end

db.close

# 3
# what if artist doesn't exist yet when entering album?
# how to print artist name?

# 5 - new song
# no artist_id...
# do we have to explicitly add artist if album is already associated with artist?
# what if album doesn't exist yet?

# else
# how to go back to case statement

# or - typing in either id or artist

# leverages appropriate OOP
# how to make OOP: make functions?