class City < ActiveRecord::Base
  has_many :reports
  has_many :users
  has_many :streets
  before_save :downcase_fields
  
  def downcase_fields
    self.name.downcase!
  end
  
  def cname
    self.name.titleize
  end
  
  validates :name, uniqueness: true, presence: true, length: { maximum: 40 }
end
