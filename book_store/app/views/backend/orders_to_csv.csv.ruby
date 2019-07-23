require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id 作成日 更新日 発送日 商品 住所 氏名 電話 アドレス 性別 年齢)
  csv << csv_column_names
  @orders.each do |order|
    csv_column_values = [
      order.id,
      order.created_at,
      order.updated_at,
      order.sended_at,
      order.syohin,
      order.jusyo,
      order.shimei,
      order.denwa,
      order.mailadd,
      order.seibetu,
      order.nenrei
    ]
    csv << csv_column_values
  end
end