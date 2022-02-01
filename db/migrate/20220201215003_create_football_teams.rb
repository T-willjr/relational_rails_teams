class CreateFootballTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :football_teams do |t|
      t.string :name
      t.boolean :public
      t.integer :titles

      t.timestamps
    end
  end
end
