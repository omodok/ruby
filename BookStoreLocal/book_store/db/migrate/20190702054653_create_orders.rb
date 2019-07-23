class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :syohin
      t.text :jusyo
      t.string :shimei
      t.string :denwa
      t.string :mailadd
      t.string :seibetu
      t.integer :nenrei

      t.timestamps
    end
  end
end
