class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :amount
      t.string :category
      t.datetime :mfd
      t.datetime :exp

      t.timestamps
    end
  end
end
