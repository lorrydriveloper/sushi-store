class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name
      t.float :price
      t.integer :pieces
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
