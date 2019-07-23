class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :shimei, :string
    add_column :users, :jusyo, :text
    add_column :users, :denwa, :string
    add_column :users, :seibetu, :string
    add_column :users, :nenrei, :integer
  end
end
