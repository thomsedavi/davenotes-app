class Course < ActiveRecord::Base
  belongs_to :school

  def self.search(search)
    where("lower(code) LIKE lower(?) OR lower(title) LIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
