class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :store_id
      t.text :syohin
      t.string :taisyo
      t.string :hontai
      t.string :tyosya
      t.string :teisai
      t.text :naiyo
      t.string :img_path

      t.timestamps
    end
  end
end
