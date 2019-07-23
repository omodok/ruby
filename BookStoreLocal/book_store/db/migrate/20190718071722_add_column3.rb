class AddColumn3 < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :sended_at, :datetime
  end
end