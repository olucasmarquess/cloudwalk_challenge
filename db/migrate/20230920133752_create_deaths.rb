class CreateDeaths < ActiveRecord::Migration[7.0]
  def change
    create_table :deaths do |t|
      t.references :match, foreign_key: true
      t.references :killer, foreign_key: { to_table: :players }
      t.references :killed, foreign_key: { to_table: :players }
      t.string :cause

      t.timestamps
    end
  end
end