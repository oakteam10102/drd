class Procedure < ActiveRecord::Base
  has_many :costs
  has_many :practices, through: :costs
end
