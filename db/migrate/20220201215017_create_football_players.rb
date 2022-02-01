class CreateFootballPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :football_players do |t|
      t.string :name
      t.boolean :eligible
      t.integer :jersey_number
      t.references :football_team, foreign_key: true

      t.timestamps 
    end
  end
end
