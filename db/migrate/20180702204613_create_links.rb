class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :url
      t.text :commentary
      t.integer :position
      t.references :magazine, index: true


      t.timestamps
    end
  end
end
