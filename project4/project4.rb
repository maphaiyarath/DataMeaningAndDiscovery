# Michelle Aphaiyarath
# Project 4 -> RDBMS

require 'sqlite3'

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SCHEMA = "SELECT songs.name, albums.name, artists.name, genres.name FROM songs, albums, artists, genres;"
# WHERE songs.id = albums.song_id = artists.song_id = genres.song_id;"
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ALBUMS = "SELECT name FROM albums;"
SQL_SELECT_ARTISTS = "SELECT name FROM artists;"

# correctly configures, connects & disconnects from DB
db = SQLite3::Database.new(DB_FILE_NAME)

# displays initial menu of 5 options to user
puts "Welcome to the music database!"
puts "	1. Display all song information."
puts "	2. Add a new genre."
puts "	3. Add a new album."
puts "	4. Add a new artist."
puts "	5. Add a new song."
print "Enter a choice: "
user_input = gets.chomp

case user_input
when '1.'
	# how to do id stuff so u can correctly print info???
	db.execute(SQL_SCHEMA) do |row|
		puts row
	end
when '2.'
	# enables user to add new genre name
	puts "Genres in the database:"
	db.execute(SQL_SELECT_GENRES) do |row|
		puts row
	end
	print "New genre name: "
	new_genre = gets.chomp
	genres_table = "INSERT INTO genres (name) VALUES ('#{new_genre}');"
	db.execute(genres_table)
when '3.'
	# enables user to add new artist name
	puts "Albums in the database:"
	db.execute(SQL_SELECT_ALBUMS) do |row|
		puts row
	end
	print "New album name: "
	new_album = gets.chomp
	albums_table = "INSERT INTO albums (name) VALUES ('#{new_album}');"
	db.execute(albums_table)
when '4.'
	# enables user to add new album name
	puts "Artists in the database:"
	db.execute(SQL_SELECT_ARTISTS) do |row|
		puts row
	end
	print "New artist name: "
	new_artist = gets.chomp
	artists_table = "INSERT INTO artists (name) VALUES ('#{new_artist}');"
	db.execute(artists_table)
when '5.'
	#
else
	puts "Please choose an option from 1. to 5., thanks!"
end

db.close

# lists all songs, albums, artists & genres
# enables user to add new song, per spec
# leverages appropriate OOP