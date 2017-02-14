class Department < ActiveRecord::Base
  has_many :reports
  has_many :users
  
  validates :name, uniqueness: true, presence: true
end
