class AddDummyRatingToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :dummy_rating, :float
  end
end
