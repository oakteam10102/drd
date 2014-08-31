class Cost < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :practice
end
