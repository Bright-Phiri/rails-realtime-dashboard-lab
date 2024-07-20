class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :books_count, default: 0

      t.timestamps
    end
  end
end