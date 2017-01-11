class AddUrlToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :url, :text
  end
end
