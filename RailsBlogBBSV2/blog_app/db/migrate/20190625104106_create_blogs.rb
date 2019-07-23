class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :shimei
      t.string :subject
      t.text :message
      t.string :mailadd
      t.string :img_path

      t.timestamps
    end
  end
end
