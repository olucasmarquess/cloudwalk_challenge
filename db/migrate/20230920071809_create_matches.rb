class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :total_kills, default: 0
      t.jsonb :players, default: []
      t.jsonb :kills, default: {}
      t.jsonb :kills_by_means, default: {}
      t.integer :world_kills, default: 0

      t.timestamps
    end
  end
end
