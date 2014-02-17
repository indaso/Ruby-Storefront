class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :amount
      t.float :price
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
