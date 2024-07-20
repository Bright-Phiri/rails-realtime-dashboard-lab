class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :name
      t.string :publisher
      t.integer :quantity
      t.string :section
      t.belongs_to :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
