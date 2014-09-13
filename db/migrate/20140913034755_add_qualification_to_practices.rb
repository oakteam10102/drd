class AddQualificationToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :qualification, :string
  end
end
