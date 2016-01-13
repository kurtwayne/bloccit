class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :copy
      t.integer :price
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
