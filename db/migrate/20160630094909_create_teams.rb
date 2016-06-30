class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :school_id, null: false
      t.integer :tournament_id, null: false
      t.string :division, null: false
      t.timestamps null: false
    end
  end
end
