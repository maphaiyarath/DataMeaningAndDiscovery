# Michelle Aphaiyarath
# Project 4 -> RDBMS

require 'sqlite3'

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "SELECT name FROM genres;"

# correctly configures, connects & disconnects from DB
db = SQLite3::Database.new(DB_FILE_NAME)

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
	#
when '2.'
	puts "Genres in the database:"
	db.execute(SQL_SELECT_GENRES) do |row|
		puts row
	end
	print "New genre name: "
	new_genre = gets.chomp
when '3.'
	#
when '4.'
	#
when '5.'
	#
else
	puts "Please choose an option from 1. to 5., thanks!"
end

db.close

# displays initial menu of 5 options to user
# lists all songs, albums, artists & genres
# enables user to add new genre name
# enables user to add new artist name
# enables user to add new album name
# enables user to add new song, per spec
# leverages appropriate OOP