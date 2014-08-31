class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.boolean :shown

      t.timestamps
    end
  end
end
