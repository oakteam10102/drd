class Practice < ActiveRecord::Base
  has_many :costs
  has_many :procedures, through: :costs
end
