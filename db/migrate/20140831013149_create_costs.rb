class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :procedure, index: true
      t.references :practice, index: true
      t.float :cost
      t.boolean :shown

      t.timestamps
    end
  end
end
