class CreateWeaponsUsed < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons_useds do |t|
      t.references :weapon, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :times_used

      t.timestamps
    end
  end
end
