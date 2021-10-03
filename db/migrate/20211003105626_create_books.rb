class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.decimal :price
      t.string :picture_url
      t.text :description

      t.timestamps
    end
  end
end
