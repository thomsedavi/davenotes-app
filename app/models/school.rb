class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 255 }
  validates :country, presence: true, length: { maximum: 255 }
  validates :website, presence: true, length: { maximum: 255 }
  validates :primary_colour, presence: true, length: { maximum: 31 }
  validates :secondary_colour, presence: true, length: { maximum: 31 }
  validates :text_colour, presence: true, length: { maximum: 31 }

  def self.search(search)
    where("lower(name) LIKE lower(?) OR lower(country) LIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
