class CreateBasketballTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :basketball_teams do |t|
      t.string :name
      t.boolean :winning_record
      t.integer :titles

      t.timestamps
    end
  end
end
