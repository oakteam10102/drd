class AddDummyBookingToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :dummy_booking, :integer
  end
end
