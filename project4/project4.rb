# Michelle Aphaiyarath
# Project 4 -> RDBMS

require 'sqlite3'

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "SELECT name FROM genres;"

# correctly configures, connects & disconnects from DB
db = SQLite3::Database.new(DB_FILE_NAME)

db.execute(SQL_SELECT_GENRES) do |row|
	puts row
end

db.close

# displays initial menu of 5 options to user
# lists all songs, albums, artists & genres
# enables user to add new genre name
# enables user to add new artist name
# enables user to add new album name
# enables user to add new song, per spec
# leverages appropriate OOP