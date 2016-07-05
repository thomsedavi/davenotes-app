class Course < ActiveRecord::Base
  belongs_to :school

  validates :title,  presence: true, length: { maximum: 255 }
  validates :code,  presence: true, length: { maximum: 255 }

  def self.search(search)
    where("lower(code) LIKE lower(?) OR lower(title) LIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
