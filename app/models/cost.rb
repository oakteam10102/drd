class Cost < ActiveRecord::Base
  scope :by_practice_name, -> name {
    joins(:practice).where('practices.name LIKE ?', "%#{name}%") if name.present?
  }

  scope :by_price, -> price_array {
    where("price > ? ", price_array.min) if price_array.present?
  }
  scope :by_rating, -> rating_array {
    joins(:practice).where("practices.dummy_rating >= ? ", rating_array.min) if rating_array.present?
  }
  
  belongs_to :procedure
  belongs_to :practice

  def self.search(name)
    if name
      q = "%#{name}%"
      joins(:practice).where('practices.name LIKE ?', q)
    else
      find(:all)
    end
  end

  # def self.by_price(price_array)
  #   if price_array.present?
  #     where("price > ? ", price_array.min)
  #   else
  #     all 
  #   end
  # end
end
