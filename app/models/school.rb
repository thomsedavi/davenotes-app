class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  def self.search(search)
    where("lower(name) LIKE lower(?) OR lower(country) LIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
