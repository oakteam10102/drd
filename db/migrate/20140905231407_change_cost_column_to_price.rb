class ChangeCostColumnToPrice < ActiveRecord::Migration
  def change
    rename_column :costs, :cost, :price
  end
end
