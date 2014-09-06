class Cost < ActiveRecord::Base
  scope :by_practice_name, -> name {
    joins(:practice).where('practices.name LIKE ?', "%#{name}%") if name.present?
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
end
