class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name
      t.integer :total_kills, default: 0
      t.string :original_name

      t.timestamps
    end

    add_index :players, :email,                unique: true
  end
end
