class CreatePlaylists < ActiveRecord::Migration[4.2]
 def change
 	create_table :songs do |t|
 		t.string :song_name
 		t.string :played_status
 		t.timestamps
 	end
  end
end