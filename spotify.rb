# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
require 'byebug'
# Your Code begins from this line onwards #
action = ARGV[0]
if action == "add"
	song = Song.create(song_name: ARGV[1], played_status: ARGV[2])
	song.save
elsif action == "list"
	songCount = 1
	puts "No. Description   Played Status"
	puts "=== ===========   ============="
	Song.all.order("played_status desc").each do |t|
		puts songCount.to_s.ljust(3) + " " + t.song_name.to_s.ljust(13) + " " + t.played_status.to_s
		songCount +=1
	end
elsif action == "update"
	if ARGV[1] != nil
		song = Song.all.order("played_status desc")[ARGV[2].to_i - 1]
		song.update(song_name: ARGV[2], played_status: ARGV[3])
		song.save
	else
		puts "Song number #{ARGV[1]} is not found. Are you sure that this is the right song number?"
	end	
elsif action == "remove"
	if ARGV[1] != nil
		song = Song.all.order("played_status desc")[ARGV[1].to_i - 1]
		song.destroy
	else
		puts "Song name #{ARGV[1]} is not found. Are you sure that this is the right song number?"
	end
else
	puts "#{ARGV} is not a valid song selection. Please enter a valid selection."
end


