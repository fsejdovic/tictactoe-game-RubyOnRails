class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board
      t.string :player_1
      t.string :player_2
      t.string :current_player

      t.timestamps null: false
    end
  end
end
