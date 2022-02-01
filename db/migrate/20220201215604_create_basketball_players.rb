class CreateBasketballPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :basketball_players do |t|
      t.string :name
      t.boolean :injured
      t.integer :jersey_number
      t.references :basketball_team, foreign_key: true

      t.timestamps
    end
  end
end
