class CreateTuikameibos < ActiveRecord::Migration[5.2]
  def change
    create_table :tuikameibos do |t|
      t.integer :meibo_id
      t.string :faxnum
      t.string :mailadd

      t.timestamps
    end
  end
end