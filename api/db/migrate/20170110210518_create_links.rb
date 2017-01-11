class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.belongs_to :page, index: true
      t.string :text
      t.text :link

      t.timestamps
    end
  end
end
