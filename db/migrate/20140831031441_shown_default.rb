class ShownDefault < ActiveRecord::Migration
  def up
    change_column :costs, :shown, :boolean, default: true
    change_column :practices, :shown, :boolean, default: true
    change_column :procedures, :shown, :boolean, default: true
  end

  def down
    change_column :costs, :shown, :boolean, default: nil
    change_column :practices, :shown, :boolean, default: nil
    change_column :procedures, :shown, :boolean, default: nil
  end
end
