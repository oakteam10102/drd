class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name
      t.text :address
      t.integer :zipcode
      t.boolean :shown

      t.timestamps
    end
  end
end
