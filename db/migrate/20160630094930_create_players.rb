class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :cell
      t.boolean :captain
      t.integer :school_id, null: false
      t.integer :grad_year
      t.timestamps null: false
    end
  end
end
