class CreateMeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :meibos do |t|
      t.string :shimei
      t.text :jusyo
      t.string :denwa

      t.timestamps
    end
  end
end
