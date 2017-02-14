class Street < ActiveRecord::Base
  belongs_to :city
  has_many :reports
  
    def sname
    self.name.titleize
  end
  
  validates :city, presence: true
end
