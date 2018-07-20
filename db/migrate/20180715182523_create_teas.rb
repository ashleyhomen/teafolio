class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :aka
      t.string :oxidation
      t.string :description
      t.integer :rating, default: 0
      t.timestamps
    end
  end
end
