class AddColumn2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cus_id, :string
    add_column :users, :last4, :string
    add_column :users, :meigi, :string
  end
end
