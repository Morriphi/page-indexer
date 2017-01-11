class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :h1
      t.text :h2
      t.text :h3

      t.timestamps
    end
  end
end
