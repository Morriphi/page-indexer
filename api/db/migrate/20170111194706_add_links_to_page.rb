class AddLinksToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :links, :text
  end
end
